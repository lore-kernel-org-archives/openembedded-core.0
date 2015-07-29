Return-Path: <Abdur_Rehman@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 0FE7973237
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 18:05:57 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-05.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ZKVjo-0003zh-W1 from Abdur_Rehman@mentor.com ;
	Wed, 29 Jul 2015 11:05:57 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.194]) by
	SVR-IES-FEM-05.mgc.mentorg.com ([137.202.0.112]) with mapi id
	14.03.0224.002; Wed, 29 Jul 2015 19:05:55 +0100
From: "Rehman, Abdur" <Abdur_Rehman@mentor.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] watchdog: kill update-rc.d when not using
	sysvinit
Thread-Index: AQHQyViMTysqnF1cXUK6A+xsq8VfE53xSaIAgAF01/8=
Date: Wed, 29 Jul 2015 18:05:54 +0000
Message-ID: <8663FA6B07BCC94795FAD21C9CC5ACF73783C098@EU-MBX-01.mgc.mentorg.com>
References: <1438103507-63604-1-git-send-email-abdur_rehman@mentor.com>,
	<CAJTo0LZiEWScYqCJBfzrMQ=02vkb9jd5a-6+VvSZBqePZgr7yg@mail.gmail.com>
In-Reply-To: <CAJTo0LZiEWScYqCJBfzrMQ=02vkb9jd5a-6+VvSZBqePZgr7yg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.68]
MIME-Version: 1.0
Cc: "Larson, Chris" <Chris_Larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] watchdog: kill update-rc.d when not using sysvinit
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
X-List-Received-Date: Wed, 29 Jul 2015 18:05:58 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8663FA6B07BCC94795FAD21C9CC5ACF73783C098EUMBX01mgcmento_"

--_000_8663FA6B07BCC94795FAD21C9CC5ACF73783C098EUMBX01mgcmento_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

watchdog_5.14.bb does not inherit systemd, and so INHIBIT_UPDATERCD_BBCLASS=
 does
not get set.

While trying to build watchdog with systemd in DISTRO_FEATURES but not sysv=
init,
following warning is observed:
    WARNING: QA Issue: watchdog rdepends on initscripts-functions, but it i=
sn't
    a build dependency? [build-deps]

Since sysvinit is not in DISTRO_FEATURES and INHIBIT_UPDATERCD_BBCLASS is n=
ot
set, the logic in update-rc.d.bbclass goes on to add an rdep for watchdog o=
n
initscripts-functions, inside update_rcd_package(). And this results in the
QA warning.

The patch sets INHIBIT_UPDATERCD_BBCLASS in the recipe to force
populate_packages_updatercd() not to proceed with update_rcd_package().

Kindly suggest if there is a better way to tackle this issue.

Abdur Rehman
________________________________
From: Burton, Ross [ross.burton@intel.com]
Sent: Wednesday, July 29, 2015 1:46 AM
To: Rehman, Abdur
Cc: OE-core; Larson, Chris
Subject: Re: [OE-core] [PATCH] watchdog: kill update-rc.d when not using sy=
svinit


On 28 July 2015 at 18:11, Abdur Rehman <abdur_rehman@mentor.com<mailto:abdu=
r_rehman@mentor.com>> wrote:
+python () {
+    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d=
):
+        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
+}

Isn't this what the update-rcd logic does already:

    # Check that this class isn't being inhibited (generally, by
    # systemd.bbclass) before doing any work.
    if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) or =
\
       not d.getVar("INHIBIT_UPDATERCD_BBCLASS", True):

Ross

--_000_8663FA6B07BCC94795FAD21C9CC5ACF73783C098EUMBX01mgcmento_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style id=3D"owaParaStyle" type=3D"text/css">P {margin-top:0;margin-bottom:=
0;}</style>
</head>
<body ocsi=3D"0" fpstyle=3D"1">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">watchdog_5.14.bb does not inherit systemd, and so INHIBIT_UPDATERCD_=
BBCLASS does<br>
not get set.<br>
<br>
While trying to build watchdog with systemd in DISTRO_FEATURES but not sysv=
init,<br>
following warning is observed:<br>
&nbsp;&nbsp;&nbsp; WARNING: QA Issue: watchdog rdepends on initscripts-func=
tions, but it isn't<br>
&nbsp;&nbsp;&nbsp; a build dependency? [build-deps]<br>
<br>
Since sysvinit is not in DISTRO_FEATURES and INHIBIT_UPDATERCD_BBCLASS is n=
ot<br>
set, the logic in update-rc.d.bbclass goes on to add an rdep for watchdog o=
n<br>
initscripts-functions, inside update_rcd_package(). And this results in the=
<br>
QA warning.<br>
<br>
The patch sets INHIBIT_UPDATERCD_BBCLASS in the recipe to force<br>
populate_packages_updatercd() not to proceed with update_rcd_package().<br>
<br>
Kindly suggest if there is a better way to tackle this issue.<br>
<br>
Abdur Rehman<br>
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
">
<hr tabindex=3D"-1">
<div style=3D"direction: ltr;" id=3D"divRpF632912"><font face=3D"Tahoma" co=
lor=3D"#000000" size=3D"2"><b>From:</b> Burton, Ross [ross.burton@intel.com=
]<br>
<b>Sent:</b> Wednesday, July 29, 2015 1:46 AM<br>
<b>To:</b> Rehman, Abdur<br>
<b>Cc:</b> OE-core; Larson, Chris<br>
<b>Subject:</b> Re: [OE-core] [PATCH] watchdog: kill update-rc.d when not u=
sing sysvinit<br>
</font><br>
</div>
<div></div>
<div>
<div dir=3D"ltr">
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">On 28 July 2015 at 18:11, Abdur Rehman <span dir=
=3D"ltr">&lt;<a href=3D"mailto:abdur_rehman@mentor.com" target=3D"_blank">a=
bdur_rehman@mentor.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left:1=
px #ccc solid; padding-left:1ex">
<div id=3D":l5" class=3D"a3s" style=3D"overflow:hidden">&#43;python () {<br=
>
&#43;&nbsp; &nbsp; if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', =
True, False, d):<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp; d.setVar(&quot;INHIBIT_UPDATERCD_BBCLASS&q=
uot;, &quot;1&quot;)<br>
&#43;}</div>
</blockquote>
</div>
<br>
Isn't this what the update-rcd logic does already:</div>
<div class=3D"gmail_extra"><br>
</div>
<div class=3D"gmail_extra">
<div class=3D"gmail_extra">&nbsp; &nbsp; # Check that this class isn't bein=
g inhibited (generally, by</div>
<div class=3D"gmail_extra">&nbsp; &nbsp; # systemd.bbclass) before doing an=
y work.</div>
<div class=3D"gmail_extra">&nbsp; &nbsp; if bb.utils.contains('DISTRO_FEATU=
RES', 'sysvinit', True, False, d) or \</div>
<div class=3D"gmail_extra">&nbsp; &nbsp; &nbsp; &nbsp;not d.getVar(&quot;IN=
HIBIT_UPDATERCD_BBCLASS&quot;, True):</div>
<div class=3D"gmail_extra"><br>
</div>
<div class=3D"gmail_extra">Ross</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_8663FA6B07BCC94795FAD21C9CC5ACF73783C098EUMBX01mgcmento_--
