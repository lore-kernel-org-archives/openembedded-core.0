Return-Path: <petter@technux.se>
Received: from vsp-authed-01-02.binero.net (unknown [195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id 8757D605B2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 May 2014 22:31:43 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-01-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Sun, 11 May 2014 00:31:56 +0200 (CEST)
Received: from webmail.binero.se (unknown [195.74.38.9])
	(Authenticated sender: petter@technux.se)
	by smtp-02-01.atm.binero.net (Postfix) with ESMTPA id B782F3A116;
	Sun, 11 May 2014 00:31:37 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 11 May 2014 00:31:37 +0200
From: petter@technux.se
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAMKF1sob1+VHoBZQxjm-MkrPE02+f6JKqzGaxiNz0yNL-WA2ZQ@mail.gmail.com>
References: <cover.1399671290.git.petter@technux.se>
	<a517943d9b90ee7793ec9f6734a0bdd80c38d75f.1399671290.git.petter@technux.se>
	<CAMKF1sob1+VHoBZQxjm-MkrPE02+f6JKqzGaxiNz0yNL-WA2ZQ@mail.gmail.com>
Message-ID: <df4fba969a1fcfe305dd2d3d304bfc35@technux.se>
X-Sender: petter@technux.se
User-Agent: Binero Webmail/0.8.4
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 01/13] systemtap: remove usage of FILESPATH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 10 May 2014 22:31:51 -0000
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

2014-05-10 18:58 skrev Khem Raj:

> On Sat, May 10, 2014 at 1:05 AM, Petter Mabäcker <petter@technux.se>
> wrote:
>
>> +FILESEXTRAPATHS_prepend := "${THISDIR}/systemtap:"
>
> would something like
>
> FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemtap:"
>
> avoid the prepend and immediate evaluation

I guess someone with deep bitbake knowledge can answer this better. But 
as far as I understand, you should always use immediate evaluation when 
using THISDIR, to be extra safe. Not sure if it's more safe to use 
FILE_DIRNAME if you want to avoid immediate expanding when using 
FILESEXTRAPATHS?

The bitbake documentations says:

"The operators "_append" and "_prepend" differ from the operators ".=" 
and "=." in that they are deferred until after parsing completes rather 
than being immediately applied."

Not sure if above means that "=." will also immediately expand 
variables or not?

Personally I have always used FILESEXTRAPATHS_prepend := 
"${THISDIR}/<somename>:" like the yocto documentation recommends. But 
sure if you can avoid immediate expanding in FILESEXTRPATHS, that would 
mean a tiny optimization. In that case perhaps the documentation should 
be updated as well. Looking in meta-layer both methods seems to be used.

