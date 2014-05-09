Return-Path: <petter@technux.se>
Received: from vsp-authed-04-02.binero.net (unknown [195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id 0DED760781
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 05:11:51 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-04-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Fri,  9 May 2014 07:11:46 +0200 (CEST)
Received: from webmail.binero.se (unknown [195.74.38.9])
	(Authenticated sender: petter@technux.se)
	by smtp-02-01.atm.binero.net (Postfix) with ESMTPA id 92DCD3A12B;
	Fri,  9 May 2014 07:11:45 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 09 May 2014 07:11:45 +0200
From: petter@technux.se
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20140508104920.GN30955@jama>
References: <cover.1399497346.git.petter@technux.se>
	<ef46a93d3cc0aba1ae86b5c78c29374b0e9eacd5.1399497346.git.petter@technux.se>
	<20140508104920.GN30955@jama>
Message-ID: <f2f3d18c11fd962075e9359a20a4bcd6@technux.se>
X-Sender: petter@technux.se
User-Agent: Binero Webmail/0.8.4
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 06/13] mesa: remove usage of FILESPATH
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
X-List-Received-Date: Fri, 09 May 2014 05:11:58 -0000
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

2014-05-08 12:49 skrev Martin Jansa:

> On Wed, May 07, 2014 at 11:19:52PM +0200, Petter Mabäcker wrote:
>
>> Fixes [YOCTO #4497] Usage of FILESPATH is discouraged, since it can
>> make recipes harder to bbappend. Instead FILESEXTRAPATHS should be 
>> used
>> to extend the path. Avoid using files dir in mesa, since current
>> patchdirs are only shared between some of the bb-files. Also remove
>> unused filespath addition. Signed-off-by: Petter Mabäcker
>> <petter@technux.se> --- meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb 
>> | 2
>> +- 1 file changed, 1 insertion(+), 1 deletion(-) diff --git
>> a/meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb
>> b/meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb index 8c7d8e8..9059207
>> 100644 --- a/meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb +++
>> b/meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb @@ -2,7 +2,7 @@ 
>> require
>> mesa_${PV}.bb SUMMARY += " (OpenGL only, no EGL/GLES)" -FILESPATH =
>> "${@base_set_filespath(["${FILE_DIRNAME}/mesa-${PV}",
>> "${FILE_DIRNAME}/mesa"], d)}" +FILESEXTRAPATHS_prepend :=
>> "${THISDIR}/mesa:"
>
> This was prefering files from mesa-${PV} (when there was version
> specific file available) now it doesn't, is it correct?

Yes, at least I think this is correct, since no patch/files exists in 
mesa-${PV} dir for the moment. If someone in the future would like to 
add files that is version unique, then they will not apply for mesa-gl 
since it's not in it's path (after this change). So you then just have 
to make a new decision if the file should be added before or after 
"mesa/". But I cannot of course add it back, if you or someone else know 
about any pitfall I should watch out for?

>
>> PROVIDES = "virtual/libgl virtual/mesa" -- 1.7.9.5 --
>> _______________________________________________ Openembedded-core
>> mailing list Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core [1]


Links:
------
[1] http://lists.openembedded.org/mailman/listinfo/openembedded-core

