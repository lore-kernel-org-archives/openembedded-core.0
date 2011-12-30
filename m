Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RgdDf-00010v-SL
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 15:14:04 +0100
Received: by iakh37 with SMTP id h37so21685453iak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Dec 2011 06:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type;
	bh=q11hxl4vpM4/Kl0dVT/LxeQG6o4yf3qmX2Va1uNVoGY=;
	b=hX7myuk/zVMPWOPOkds6IU7cIBgSdxdJaDyuXw2YKykF2wmiEetVqR0eO1UxTwVMim
	2ua1QbWZAQzv4VDD3iWTcemCCAIcFnfhNrOnHw1wKTaQu+vS8/AmQOF2n+DV/Yz2nXnC
	GxbHBOZbI1Z0QPKS70O+4h5XUC5wqZIlpHDPE=
Received: by 10.42.174.198 with SMTP id w6mr13452440icz.37.1325254003738;
	Fri, 30 Dec 2011 06:06:43 -0800 (PST)
Received: from frey.local (ip24-251-167-38.ph.ph.cox.net. [24.251.167.38])
	by mx.google.com with ESMTPS id z22sm127963707ibg.5.2011.12.30.06.06.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Dec 2011 06:06:42 -0800 (PST)
Date: Fri, 30 Dec 2011 07:06:40 -0700
From: Christopher Larson <kergoth@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <BF6213F961304DF4B3C0F85E33560FE1@gmail.com>
In-Reply-To: <6ad22f9852cfd011244b3e511f5e563007f7ac5c.1325215668.git.lianhao.lu@intel.com>
References: <cover.1325215668.git.lianhao.lu@intel.com>
	<6ad22f9852cfd011244b3e511f5e563007f7ac5c.1325215668.git.lianhao.lu@intel.com>
X-Mailer: sparrow 1.5 (build 1043.1)
MIME-Version: 1.0
Subject: Re: [PRService/meta 1/3] meta/PRService: Added export/import fuctions.
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
X-List-Received-Date: Fri, 30 Dec 2011 14:14:04 -0000
Content-Type: multipart/alternative; boundary="4efdc570_5db70ae5_44e4"

--4efdc570_5db70ae5_44e4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday, December 29, 2011 at 8:50 PM, Lianhao Lu wrote:
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 9040eb4..07d6f9a 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -351,10 +351,19 @@ def runtime_mapping_rename (varname, d):
> 
> python package_get_auto_pr() {
> if d.getVar('USE_PR_SERV', True) != "0":
> - auto_pr=prserv_get_pr_auto(d)
> - if auto_pr is None:
> - bb.fatal("Can NOT get auto PR revision from remote PR service")
> + try:
> + auto_pr=prserv_get_pr_auto(d)
> + except Exception as e:
> + bb.error(str(e))
> + raise bb.build.FuncFailed(e)


Don't do this. I realize there are flawed examples of this elsewhere in the metadata, but this isn't what FuncFailed is intended for. It's what the bitbake exec_func raises when a function fails, not what a function it executes should be raising.
-- 
Christopher Larson



--4efdc570_5db70ae5_44e4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


                <div><span style=3D=22color: rgb(160, 160, 168); =22>On T=
hursday, December 29, 2011 at 8:50 PM, Lianhao Lu wrote:</span></div>
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
-family: Helvetica; font-size: 13px; =22><div>diff --git a/meta/classes/p=
ackage.bbclass b/meta/classes/package.bbclass</div><div>index 9040eb4..07=
d6f9a 100644</div><div>--- a/meta/classes/package.bbclass</div><div>+++ b=
/meta/classes/package.bbclass</div><div>=40=40 -351,10 +351,19 =40=40 def=
 runtime=5Fmapping=5Frename (varname, d):</div><div></div><div>python pac=
kage=5Fget=5Fauto=5Fpr() =7B</div><div>if d.getVar('USE=5FPR=5FSERV', Tru=
e) =21=3D =220=22:</div><div>-	 auto=5Fpr=3Dprserv=5Fget=5Fpr=5Fauto(d)</=
div><div>-	 if auto=5Fpr is None:</div><div>-	 bb.fatal(=22Can NOT get au=
to PR revision from remote PR service=22)</div><div>+	 try:</div><div>+	 =
auto=5Fpr=3Dprserv=5Fget=5Fpr=5Fauto(d)</div><div>+	 except Exception as =
e:</div><div>+	 bb.error(str(e))</div><div>+	 raise bb.build.=46unc=46ail=
ed(e)</div></span></span></span>
                =20
                =20
                =20
                =20
                </blockquote>
                =20
                <div>
                    <br>
                </div><div>Don't do this. I realize there are flawed exam=
ples of this elsewhere in the metadata, but this isn't what =46unc=46aile=
d is intended for. It's what the bitbake exec=5Ffunc raises when a functi=
on fails, not what a function it executes should be raising.</div><div>--=
&nbsp;</div><div><div><div>Christopher Larson</div></div></div>
            

--4efdc570_5db70ae5_44e4--
