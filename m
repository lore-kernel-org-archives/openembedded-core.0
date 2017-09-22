Return-Path: <nandojve@gmail.com>
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
	[209.85.161.172])
	by mail.openembedded.org (Postfix) with ESMTP id 00CF66006E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 10:30:06 +0000 (UTC)
Received: by mail-yw0-f172.google.com with SMTP id l4so438033ywa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 03:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=Uh9zmeACCgigJO1bEETdIeFdUfjq6oxRxA0uYr8xCC4=;
	b=m7dEb83kXTdG3o8f9rukOMeCHgXVaKlmeftMtR8mKj239Wt3mDW91Hg8/LBbHSaY+3
	r75QLOn5+1uR71qdcwYBTDxWnOglxUl+ijZWxSZCoRkdUbYrA+1VZRjdp7uXH3wfMNW0
	B91uLj7DbDx2GoXtUlc5dcs26/qI4/IhrFaFKmblA0xym1lV4ciqtSdHmKZS0Pa1monU
	uHqcNNynzYuPcFzPiBMIPE3EA0L/33BVBgTD+9m+PT2/ADDh5o67cKqGKQ5iDhInAl/d
	iLFjIpCFZXCMbzR2MDCUlLckv0Jr7Yu/f7RF8PBg4CmhJHpziIh8huzx5GCjJpi+KpU0
	WwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=Uh9zmeACCgigJO1bEETdIeFdUfjq6oxRxA0uYr8xCC4=;
	b=liY0PTdzdRW7mX72NrVBDHE+nJVqk40ioEL8esIEiFrs0XzUHVf6GhloeGdmHUPMJt
	aHDR2moYa23yjvFPqYeC482d8ebUlKBhVWY557d1FjhvJUy9E4ybsmrt6phgXnXsqYSC
	Vi5Fll0/vlKEqe4Pb1uqgqHR6zHmjNPIuFWJSXnlAr4zHadNt0DrddS87FD/+EYTaQ/7
	YEdXn4A41PHrZqVBZQ6/VCOZP7bOHoI34wDr+h+T9/APg6MWvU2ghdGpEIoDu9diYJCl
	kyddNZt5xrCFmlcfuLNd4E+yLmmxNXf/WpF6NXe1Hsz+OYb/n2AnhlSCS1H+OJhlx/0U
	HdUQ==
X-Gm-Message-State: AHPjjUhPvtiSJYEhFZkoh3ZSk20jNCgU4+/VZDChhFY1vuIWzWOYzL4I
	tfK4t+mOhUMFF6hDKdY3l11PlEFDFmnmSTM7mEI8aw==
X-Google-Smtp-Source: AOwi7QDrSCAU3cSt8Ifas/M6Sw6qh25xSF16pCrO+7dF/F9KM9eGcumkD74Plt6oPr3j9STy00SjnMZDZi54r5p+asY=
X-Received: by 10.37.64.80 with SMTP id n77mr3525467yba.196.1506076207620;
	Fri, 22 Sep 2017 03:30:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.197.84 with HTTP; Fri, 22 Sep 2017 03:30:06 -0700 (PDT)
From: Gerson Fernando Budke <nandojve@gmail.com>
Date: Fri, 22 Sep 2017 07:30:06 -0300
Message-ID: <CABOv41PKzw5yOoS+-LYCNFuAR0Nh1Q0Acv3rhFpjDYDnBtu2qw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: akuster@mvista.com
Subject: [morty][PATCH] image.bbclass: Sorted ctypes to avoid basehash error
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
X-List-Received-Date: Fri, 22 Sep 2017 10:30:07 -0000
Content-Type: multipart/alternative; boundary="001a11c024325c3f8a0559c4b165"

--001a11c024325c3f8a0559c4b165
Content-Type: text/plain; charset="UTF-8"

When selected multiple subimages a similar error could happend:
  Variable do_image_cpio[subimages] value changed \
    from 'cpio.gz.u-boot cpio.gz' to 'cpio.gz cpio.gz.u-boot'
To avoid this, 'ctypes' should be sorted at 'gen_conversion_cmds'.

This garantee that 'CONVERSION_CMD_xxx' are always written in tha same
order and consequently 'do_image_cpio' have the same hash.

(From OE-Core rev: 271f1a5f65b8685a1e3645026876251122ef3974)

Signed-off-by: Gerson Fernando Budke <nandojve@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index ef2b38aeaf..9c9f14a99a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -453,7 +453,7 @@ python () {

         rm_tmp_images = set()
         def gen_conversion_cmds(bt):
-            for ctype in ctypes:
+            for ctype in sorted(ctypes):
                 if bt.endswith("." + ctype):
                     type = bt[0:-len(ctype) - 1]
                     if type.startswith("debugfs_"):

--001a11c024325c3f8a0559c4b165
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:12.8px">When selected multiple su=
bimages a similar error could happend:</span><br style=3D"font-size:12.8px"=
><span style=3D"font-size:12.8px">=C2=A0 Variable do_image_cpio[subimages] =
value changed \</span><br style=3D"font-size:12.8px"><span style=3D"font-si=
ze:12.8px">=C2=A0 =C2=A0 from &#39;cpio.gz.u-boot cpio.gz&#39; to &#39;cpio=
.gz cpio.gz.u-boot&#39;</span><br style=3D"font-size:12.8px"><span style=3D=
"font-size:12.8px">To avoid this, &#39;ctypes&#39; should be sorted at &#39=
;gen_conversion_cmds&#39;.</span><br style=3D"font-size:12.8px"><br style=
=3D"font-size:12.8px"><span style=3D"font-size:12.8px">This garantee that &=
#39;CONVERSION_CMD_xxx&#39; are always written in tha same</span><br style=
=3D"font-size:12.8px"><span style=3D"font-size:12.8px">order and consequent=
ly &#39;do_image_cpio&#39; have the same hash.</span><br style=3D"font-size=
:12.8px"><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">(F=
rom OE-Core rev: 271f1a5f65b8685a1e364502687625</span><wbr style=3D"font-si=
ze:12.8px"><span style=3D"font-size:12.8px">1122ef3974)</span><br style=3D"=
font-size:12.8px"><br style=3D"font-size:12.8px"><span style=3D"font-size:1=
2.8px">Signed-off-by: Gerson Fernando Budke &lt;</span><a href=3D"mailto:na=
ndojve@gmail.com" style=3D"font-size:12.8px">nandojve@gmail.com</a><span st=
yle=3D"font-size:12.8px">&gt;</span><br style=3D"font-size:12.8px"><span st=
yle=3D"font-size:12.8px">Signed-off-by: Ross Burton &lt;</span><a href=3D"m=
ailto:ross.burton@intel.com" style=3D"font-size:12.8px">ross.burton@intel.c=
om</a><span style=3D"font-size:12.8px">&gt;</span><br style=3D"font-size:12=
.8px"><span style=3D"font-size:12.8px">Signed-off-by: Richard Purdie &lt;</=
span><a href=3D"mailto:richard.purdie@linuxfoundation.org" style=3D"font-si=
ze:12.8px">richard.purdie@<wbr>linuxfoundation.org</a><span style=3D"font-s=
ize:12.8px">&gt;</span><br style=3D"font-size:12.8px"><span style=3D"font-s=
ize:12.8px">---</span><br style=3D"font-size:12.8px"><span style=3D"font-si=
ze:12.8px">=C2=A0meta/classes/image.bbclass | 2 +-</span><br style=3D"font-=
size:12.8px"><span style=3D"font-size:12.8px">=C2=A01 file changed, 1 inser=
tion(+), 1 deletion(-)</span><br style=3D"font-size:12.8px"><br style=3D"fo=
nt-size:12.8px"><span style=3D"font-size:12.8px">diff --git a/meta/classes/=
image.bbclass b/meta/classes/image.bbclass</span><br style=3D"font-size:12.=
8px"><span style=3D"font-size:12.8px">index ef2b38aeaf..9c9f14a99a 100644</=
span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">--- a/=
meta/classes/image.bbclass</span><br style=3D"font-size:12.8px"><span style=
=3D"font-size:12.8px">+++ b/meta/classes/image.bbclass</span><br style=3D"f=
ont-size:12.8px"><span style=3D"font-size:12.8px">@@ -453,7 +453,7 @@ pytho=
n () {</span><br style=3D"font-size:12.8px"><br style=3D"font-size:12.8px">=
<span style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm_tmp_i=
mages =3D set()</span><br style=3D"font-size:12.8px"><span style=3D"font-si=
ze:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0def gen_conversion_cmds(bt):</=
span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">-=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for ctype in ctypes:</span><br style=
=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 for ctype in sorted(ctypes):</span><br style=3D"fo=
nt-size:12.8px"><span style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if bt.endswith(&quot;.&quot; + ctype)=
:</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ty=
pe =3D bt[0:-len(ctype) - 1]</span><br style=3D"font-size:12.8px"><span sty=
le=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0if type.startswith(&quot;debugfs_&quot;):</span>=
<div class=3D"gmail-yj6qo gmail-ajU" style=3D"margin:2px 0px 0px;font-size:=
12.8px"><div id=3D"gmail-:95h" class=3D"gmail-ajR" tabindex=3D"0"><br></div=
></div></div>

--001a11c024325c3f8a0559c4b165--
