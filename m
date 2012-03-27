Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SCeXS-0001aK-06
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 00:06:50 +0200
Received: by obqv19 with SMTP id v19so452063obq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 14:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type;
	bh=fJe3t+ubBeD3RTlr7yZV/ZWs8H6Uae2VlZlt9aP0vu4=;
	b=iyKjZm7ygS69QtugQHYJQc9hkNGeARpf0xysS9ifEz9VQ0aop7NZTh7jiMDfWcBPHH
	zUwECmzz0IXbtnHjqQSQa6DbDx6PaKVph5hVLBuXxfBMpJqZPzGUXxGFtoVXYrnwXnrB
	q5R2vVCmDc4gTl8DEn5XGNRnaluGfuVlyqDmKrfiV6UcKI1qy0Ir7rnBcUr7p0yd202O
	pEhWKcYyXAsZwdKHxSLg1hOGhqCiqcEsAC1gOy2IGU0X/EYLyPhurDBG3SmahfvFKSGR
	Vo7KUdS0m0cn0ZTjIPEeIbyICbtGF9xh0QE7ABTmjHhCA6p+9m00nNLGuqaAIJ4xi1hI
	z4oQ==
Received: by 10.182.113.106 with SMTP id ix10mr34282512obb.26.1332885467986;
	Tue, 27 Mar 2012 14:57:47 -0700 (PDT)
Received: from frey (ip68-110-79-242.ph.ph.cox.net. [68.110.79.242])
	by mx.google.com with ESMTPS id il8sm1109511obc.18.2012.03.27.14.57.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Mar 2012 14:57:47 -0700 (PDT)
Date: Tue, 27 Mar 2012 14:57:44 -0700
From: Christopher Larson <kergoth@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <F4FE715B8B374104BDAF129362EBDD00@gmail.com>
In-Reply-To: <4F723618.6060104@windriver.com>
References: <1332877869-12195-1-git-send-email-kergoth@gmail.com>
	<1332877869-12195-3-git-send-email-kergoth@gmail.com>
	<4F72219A.2020301@windriver.com>
	<CABcZANmm5BNHdMtSJJ_P6WNpkgrQ+1vhbHgDg1-9Dc_FXWbhgQ@mail.gmail.com>
	<4F723618.6060104@windriver.com>
X-Mailer: sparrow 1.5 (build 1043.1)
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] powerpc: define TUNE_PKGARCH for powerpc/powerpc-nf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2012 22:06:50 -0000
Content-Type: multipart/alternative; boundary="4f7237d8_419ac241_13b26"

--4f7237d8_419ac241_13b26
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday, March 27, 2012 at 2:50 PM, Mark Hatle wrote:
> On 3/27/12 4:05 PM, Chris Larson wrote:
> 
> 
> 
> 
> On PowerPC TUNE_PKGARCH should be set to powerpc (or overriden by the machines).
> On PowerPC64, it should be set to powerpc64. If this is not happening that is
> the bug, lack of the default TUNE_PKGARCH. (based on the original implementation.)


I don't think your point of view is covering all the issues. 

The default TUNE_PKGARCH is TUNE_PKGARCH_${TUNE_PKGARCH_tune-${DEFAULTTUNE}. If arch-powerpc.inc sets TUNE_PKGARCH directly, as it used to, then all the more specific tunings won't have their TUNE_PKGARCH_tune-<tune> obeyed, which was the behavior prior to my submitting a patch which removed the explicit TUNE_PKGARCH override in arch-powerpc.inc.

So we have two options. Either we override TUNE_PKGARCH directly in arch-powerpc.inc again, thereby making powerpc tune- files like tune-ppce500v2 not have their TUNE_PKGARCH_tune-<tune> obeyed (or those tune- files have to override TUNE_PKGARCH as well, which seems counter to the whole design of the tuning implementation), or we add TUNE_PKGARCH_tune-<tune> definitions for the generic tunings also.

-Chris

--4f7237d8_419ac241_13b26
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


                <div><span style=3D=22color: rgb(160, 160, 168); =22>On T=
uesday, March 27, 2012 at 2:50 PM, Mark Hatle wrote:</span></div>
                <blockquote type=3D=22cite=22 style=3D=22border-left-styl=
e:solid;border-width:1px;margin-left:0px;padding-left:10px;=22>
                    <span><span style=3D=22border-collapse: separate; col=
or: rgb(0, 0, 0); font-family: 'Lucida Grande'; font-style: normal; font-=
variant: normal; font-weight: normal; letter-spacing: normal; line-height=
: normal; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-tr=
ansform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit=
-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -w=
ebkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -=
webkit-text-stroke-width: 0px; font-size: 13px; =22><span style=3D=22font=
-family: Helvetica; font-size: 13px; =22><div>On 3/27/12 4:05 PM, Chris L=
arson wrote:</div><div><div onclick=3D=22toggleBlockQuoteVisibility(event=
, '4=46723618.6060104%40windriver.com-1332885016.2', '4=46723618.6060104%=
40windriver.com-1332885016')=22 onmousedown=3D=22noevent(event)=22 class=3D=
=22-sparrow-quotedTextLabelHide=22 style=3D=22font-family: Helvetica; fon=
t-size: 11px; color: rgb(0, 106, 227); white-space: nowrap; overflow-x: h=
idden; overflow-y: hidden; text-overflow: ellipsis; display: inline-block=
; cursor: default; -webkit-user-select: none; =22><div class=3D=22-sparro=
w-quotedTextButton=22 style=3D=22margin-left: -3px; width: 28px; height: =
16px; background-image: url(file:///Applications/Sparrow.app/Contents/Res=
ources/MessageShowquotedtext.png); background-repeat: no-repeat no-repeat=
; =22></div></div></div><div><br></div><div>On PowerPC TUNE=5FPKGARCH sho=
uld be set to powerpc (or overriden by the machines).</div><div>On PowerP=
C64, it should be set to powerpc64. If this is not happening that is</div=
><div>the bug, lack of the default TUNE=5FPKGARCH. (based on the original=
 implementation.)</div></span></span></span></blockquote><div><br></div><=
div>I don't think your point of view is covering all the issues.&nbsp;</d=
iv><div><br></div><div>The default TUNE=5FPKGARCH is TUNE=5FPKGARCH=5F=24=
=7BTUNE=5FPKGARCH=5Ftune-=24=7BDE=46AULTTUNE=7D. If arch-powerpc.inc sets=
 TUNE=5FPKGARCH directly, as it used to, then all the more specific tunin=
gs won't have their TUNE=5FPKGARCH=5Ftune-&lt;tune&gt; obeyed, which was =
the behavior prior to my submitting a patch which removed the explicit TU=
NE=5FPKGARCH override in arch-powerpc.inc.</div><div><br></div><div>So we=
 have two options. Either we override TUNE=5FPKGARCH directly in arch-pow=
erpc.inc again, thereby making powerpc tune- files like tune-ppce500v2 no=
t have their TUNE=5FPKGARCH=5Ftune-&lt;tune&gt; obeyed (or those tune- fi=
les have to override TUNE=5FPKGARCH as well, which seems counter to the w=
hole design of the tuning implementation), or we add TUNE=5FPKGARCH=5Ftun=
e-&lt;tune&gt; definitions for the generic tunings also.</div><div><br></=
div><div>-Chris</div>
            

--4f7237d8_419ac241_13b26--
