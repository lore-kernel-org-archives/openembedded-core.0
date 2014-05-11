Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B53CE605B3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 May 2014 12:13:19 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4BCDCei017878; Sun, 11 May 2014 13:13:12 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pWoG4uKgYopI; Sun, 11 May 2014 13:13:12 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4BCD6iA017872
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 11 May 2014 13:13:08 +0100
Message-ID: <1399810380.31891.110.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: petter@technux.se
Date: Sun, 11 May 2014 13:13:00 +0100
In-Reply-To: <df4fba969a1fcfe305dd2d3d304bfc35@technux.se>
References: <cover.1399671290.git.petter@technux.se>
	<a517943d9b90ee7793ec9f6734a0bdd80c38d75f.1399671290.git.petter@technux.se>
	<CAMKF1sob1+VHoBZQxjm-MkrPE02+f6JKqzGaxiNz0yNL-WA2ZQ@mail.gmail.com>
	<df4fba969a1fcfe305dd2d3d304bfc35@technux.se>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Sun, 11 May 2014 12:13:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2014-05-11 at 00:31 +0200, petter@technux.se wrote:
> 2014-05-10 18:58 skrev Khem Raj:
> 
> > On Sat, May 10, 2014 at 1:05 AM, Petter Mabäcker <petter@technux.se>
> > wrote:
> >
> >> +FILESEXTRAPATHS_prepend := "${THISDIR}/systemtap:"
> >
> > would something like
> >
> > FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemtap:"
> >
> > avoid the prepend and immediate evaluation
> 
> I guess someone with deep bitbake knowledge can answer this better. But 
> as far as I understand, you should always use immediate evaluation when 
> using THISDIR, to be extra safe. Not sure if it's more safe to use 
> FILE_DIRNAME if you want to avoid immediate expanding when using 
> FILESEXTRAPATHS?
> 
> The bitbake documentations says:
> 
> "The operators "_append" and "_prepend" differ from the operators ".=" 
> and "=." in that they are deferred until after parsing completes rather 
> than being immediately applied."
> 
> Not sure if above means that "=." will also immediately expand 
> variables or not?

They're not.

> Personally I have always used FILESEXTRAPATHS_prepend := 
> "${THISDIR}/<somename>:" like the yocto documentation recommends. But 
> sure if you can avoid immediate expanding in FILESEXTRPATHS, that would 
> mean a tiny optimization. In that case perhaps the documentation should 
> be updated as well. Looking in meta-layer both methods seems to be used.

What Khem means is that in the case we know we're in the .bb file
directory, we can use FILE_DIRNAME instead of using :=.

Why? FILE_DIRNAME is defined as:

conf/bitbake.conf:FILE_DIRNAME = "${@os.path.dirname(d.getVar('FILE'))}"

FILE will point to the .bb file.

Cheers,

Richard




