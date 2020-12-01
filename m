Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web08.2119.1606865159824038249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 15:25:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MIAbBmwy;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: jatedev@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id m5so17188pjv.5
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 15:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dIFrnhzAZfXZkGpoYl2OMQp6r4cx5M4wHBJlvHpffk0=;
        b=MIAbBmwyf5w6CQIYLVeXPKgfcX4fbjz5Ohsz+9z5wOv+y2jRMcZWFphDi5+7ndBsB/
         mzoefi1GAaoKrBLG06j09IBBBQAhYqkdWQejP6esihIlQkBWNd4lgycBS387XaAFISlK
         QbsZ6G1m2H0fIp9AVBaf2lngVEJjMqmG2rUcoZ1+1moHJSylEoeldluCHOhU0G7FXBVd
         0kWsqYmsgjWzj9n4OFA5DWqBlmTSy7fImQxU3m9QlzqZegAsSCy7aSkSgokBHj+uYMze
         vyKqslyaXWB79+PBliDXh7Ji4lcefPDLCGU4vV3s8qB6qlwbXiOb0ViVGNR6mLWN8yyP
         PBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dIFrnhzAZfXZkGpoYl2OMQp6r4cx5M4wHBJlvHpffk0=;
        b=pAsjPVf752PP5/yaVOVrZdcHz2/vQijOsRsmntWb9vgmYXl9FWSnyg8Trvn5obAFqS
         1n4Jvmdj3ePE3dJiKCdnkMf5axWergjJvVbgHdo0goLOzqlc32uBECjIcAk9vN2t5/vY
         D8fOpFiqdyffWIJmtS4EO3Jx8RZDh8WsFn6UedqBqUIp7oMVQnQj2SWjlNwfaoF3JVMm
         XhDE1+w1UaafICXpl8GERQkbwK87NIhZQlThVbjqQDqZBOSMhZ9Mnbs8jk1fzqKKF0Cg
         Leo6JcgZ374zX4OAoeYub5S6aXCQQ8TB27R4058pRiEXx1foeULLeZ2rkVzysmnuN2bW
         ZCsw==
X-Gm-Message-State: AOAM532+BJ6dOorV9+VLseRx3lhh6kj8mAhshWq0ImaKxrkmbRArH1/O
	HrN5v9ba+ypd4ZujxQhC/m0xWGD8z36KfcSLUPE=
X-Google-Smtp-Source: ABdhPJww2dqY3jy9eQXap1pyBVt23Fm2QKNI/OlgJWVTufAHXDzI1tyC37tTDnciQ5Qz9OBsE0Zvl5XBAs0YRUi785E=
X-Received: by 2002:a17:902:8209:b029:d6:d2c9:1db5 with SMTP id
 x9-20020a1709028209b02900d6d2c91db5mr5188809pln.54.1606865159348; Tue, 01 Dec
 2020 15:25:59 -0800 (PST)
MIME-Version: 1.0
References: <20201201152305.2375723-1-ross.burton@arm.com> <20201201152305.2375723-4-ross.burton@arm.com>
 <04b925bedf42ef5a8828bf262a39c5f85fdc2f85.camel@linuxfoundation.org> <CAAnfSTv=GdCS6Ybup5Y77sHiG1DZ7ev+sgbgeutCrPb7=GL8bQ@mail.gmail.com>
In-Reply-To: <CAAnfSTv=GdCS6Ybup5Y77sHiG1DZ7ev+sgbgeutCrPb7=GL8bQ@mail.gmail.com>
From: "Jate Sujjavanich" <jatedev@gmail.com>
Date: Tue, 1 Dec 2020 18:25:48 -0500
Message-ID: <CAPphmgY8+DXwRQdKKznk=6-V9ctc-aykDBv1fQWGeBPNbRxDng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/6] reproducible_build: clamp the rootfs tarball mtime to the epoch
To: Ross Burton <ross@burtonini.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000006664b05b56f7358"

--00000000000006664b05b56f7358
Content-Type: text/plain; charset="UTF-8"

I have started using the following code to set the mtimes of files written
after the build timestamp. It assumes that SOURCE_DATE_EPOCH of packages
are never in the future.

# Set to empty to allow custom function below to run
REPRODUCIBLE_TIMESTAMP_ROOTFS ?= ""

# Use DATETIME of build as SOURCE_DATE_EPOCH for image
export SOURCE_DATE_EPOCH = "${@int( time.mktime( time.strptime('${DATETIME}',
'%Y%m%d%H%M%S') ) ) }"

reproducible_final_image_task () {
if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
# Use commit time of tuxzilla root in usual Syntux build
REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}/../" log -1 --pretty=%ct
2>/dev/null`
if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
REPRODUCIBLE_TIMESTAMP_ROOTFS=`stat -c%Y ${@bb.utils.which(d.getVar("BBPATH"),
"conf/bitbake.conf")}`
fi
fi
# Set mtime of all files to a reproducible value
bbnote "reproducible_final_image_task: mtime set to
$REPRODUCIBLE_TIMESTAMP_ROOTFS"
# Files with mtime after build stamp should be part of rootfs creation
DAYS_SINCE_BUILD=`python3 -c "import time; print((time.time() -
${SOURCE_DATE_EPOCH}) / 86400)"`
find ${IMAGE_ROOTFS} -mtime -$DAYS_SINCE_BUILD -exec touch -h --date=@
$REPRODUCIBLE_TIMESTAMP_ROOTFS {} \;
fi
}


On Tue, Dec 1, 2020 at 12:16 PM Ross Burton <ross@burtonini.com> wrote:

> On Tue, 1 Dec 2020 at 15:45, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I'm not convinced this is correct as it could mess up the timestamps of
> > stamps set in other recipes?
> >
> > It's also tar specific and should really be across all image types?
>
> Yes, it most likely should be done at rootfs time instead.
>
> Ross
>
> 
>
>

--00000000000006664b05b56f7358
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have started using the following code to set the mt=
imes of files written after the build timestamp. It assumes that SOURCE_DAT=
E_EPOCH of packages are never in the future.<br></div><div><br></div><div><=
div style=3D"color:rgb(212,212,212);background-color:rgb(30,30,30);font-fam=
ily:Menlo,Monaco,&quot;Courier New&quot;,monospace;font-weight:normal;font-=
size:12px;line-height:18px;white-space:pre"><div><span style=3D"color:rgb(1=
06,153,85)"># Set to empty to allow custom function below to run</span></di=
v><div><span style=3D"color:rgb(156,220,254)">REPRODUCIBLE_TIMESTAMP_ROOTFS=
</span><span style=3D"color:rgb(212,212,212)"> ?=3D </span><span style=3D"c=
olor:rgb(206,145,120)">&quot;&quot;</span></div><br><div><span style=3D"col=
or:rgb(106,153,85)"># Use DATETIME of build as SOURCE_DATE_EPOCH for image<=
/span></div><div><span style=3D"color:rgb(212,212,212)">export SOURCE_DATE_=
EPOCH =3D </span><span style=3D"color:rgb(206,145,120)">&quot;${@int( time.=
mktime( time.strptime(&#39;$</span><span style=3D"color:rgb(86,156,214)">{D=
ATETIME}</span><span style=3D"color:rgb(206,145,120)">&#39;, &#39;%Y%m</spa=
n><span style=3D"color:rgb(86,156,214)">%d</span><span style=3D"color:rgb(2=
06,145,120)">%H%M%S&#39;) ) ) }&quot;</span></div><br><div><span style=3D"c=
olor:rgb(220,220,170)">reproducible_final_image_task</span><span style=3D"c=
olor:rgb(212,212,212)"> () {</span></div><div><span style=3D"color:rgb(212,=
212,212)">    </span><span style=3D"color:rgb(197,134,192)">if</span><span =
style=3D"color:rgb(212,212,212)"> [ </span><span style=3D"color:rgb(206,145=
,120)">&quot;</span><span style=3D"color:rgb(156,220,254)">${BUILD_REPRODUC=
IBLE_BINARIES}</span><span style=3D"color:rgb(206,145,120)">&quot;</span><s=
pan style=3D"color:rgb(212,212,212)"> =3D </span><span style=3D"color:rgb(2=
06,145,120)">&quot;1&quot;</span><span style=3D"color:rgb(212,212,212)"> ];=
 </span><span style=3D"color:rgb(197,134,192)">then</span></div><div><span =
style=3D"color:rgb(212,212,212)">        </span><span style=3D"color:rgb(19=
7,134,192)">if</span><span style=3D"color:rgb(212,212,212)"> [ </span><span=
 style=3D"color:rgb(206,145,120)">&quot;</span><span style=3D"color:rgb(156=
,220,254)">$REPRODUCIBLE_TIMESTAMP_ROOTFS</span><span style=3D"color:rgb(20=
6,145,120)">&quot;</span><span style=3D"color:rgb(212,212,212)"> =3D </span=
><span style=3D"color:rgb(206,145,120)">&quot;&quot;</span><span style=3D"c=
olor:rgb(212,212,212)"> ]; </span><span style=3D"color:rgb(197,134,192)">th=
en</span></div><div><span style=3D"color:rgb(212,212,212)">            </sp=
an><span style=3D"color:rgb(106,153,85)"># Use commit time of tuxzilla root=
 in usual Syntux build</span></div><div><span style=3D"color:rgb(212,212,21=
2)">            REPRODUCIBLE_TIMESTAMP_ROOTFS=3D</span><span style=3D"color=
:rgb(206,145,120)">`git -C &quot;</span><span style=3D"color:rgb(156,220,25=
4)">${COREBASE}</span><span style=3D"color:rgb(206,145,120)">/../&quot; log=
 -1 --pretty=3D%ct </span><span style=3D"color:rgb(212,212,212)">2&gt;</spa=
n><span style=3D"color:rgb(206,145,120)">/dev/null`</span></div><div><span =
style=3D"color:rgb(212,212,212)">            </span><span style=3D"color:rg=
b(197,134,192)">if</span><span style=3D"color:rgb(212,212,212)"> [ </span><=
span style=3D"color:rgb(206,145,120)">&quot;</span><span style=3D"color:rgb=
(156,220,254)">$REPRODUCIBLE_TIMESTAMP_ROOTFS</span><span style=3D"color:rg=
b(206,145,120)">&quot;</span><span style=3D"color:rgb(212,212,212)"> =3D </=
span><span style=3D"color:rgb(206,145,120)">&quot;&quot;</span><span style=
=3D"color:rgb(212,212,212)"> ]; </span><span style=3D"color:rgb(197,134,19=
2)">then</span></div><div><span style=3D"color:rgb(212,212,212)">          =
      REPRODUCIBLE_TIMESTAMP_ROOTFS=3D</span><span style=3D"color:rgb(206,1=
45,120)">`stat -c%Y </span><span style=3D"color:rgb(156,220,254)">${</span>=
<span style=3D"color:rgb(212,212,212)">@</span><span style=3D"color:rgb(156=
,220,254)">bb.utils.which(d.getVar(</span><span style=3D"color:rgb(206,145,=
120)">&quot;BBPATH&quot;</span><span style=3D"color:rgb(156,220,254)">), </=
span><span style=3D"color:rgb(206,145,120)">&quot;conf/bitbake.conf&quot;</=
span><span style=3D"color:rgb(156,220,254)">)}</span><span style=3D"color:r=
gb(206,145,120)">`</span></div><div><span style=3D"color:rgb(212,212,212)">=
            </span><span style=3D"color:rgb(197,134,192)">fi</span></div><d=
iv><span style=3D"color:rgb(212,212,212)">        </span><span style=3D"col=
or:rgb(197,134,192)">fi</span></div><div><span style=3D"color:rgb(212,212,2=
12)">        </span><span style=3D"color:rgb(106,153,85)"># Set mtime of al=
l files to a reproducible value</span></div><div><span style=3D"color:rgb(2=
12,212,212)">        bbnote </span><span style=3D"color:rgb(206,145,120)">&=
quot;reproducible_final_image_task: mtime set to </span><span style=3D"colo=
r:rgb(156,220,254)">$REPRODUCIBLE_TIMESTAMP_ROOTFS</span><span style=3D"col=
or:rgb(206,145,120)">&quot;</span></div><div><span style=3D"color:rgb(212,2=
12,212)">        </span><span style=3D"color:rgb(106,153,85)"># Files with =
mtime after build stamp should be part of rootfs creation</span></div><div>=
<span style=3D"color:rgb(212,212,212)">        DAYS_SINCE_BUILD=3D</span><s=
pan style=3D"color:rgb(206,145,120)">`python3 -c &quot;import time; print((=
time.time() - </span><span style=3D"color:rgb(156,220,254)">${SOURCE_DATE_E=
POCH}</span><span style=3D"color:rgb(206,145,120)">) / 86400)&quot;`</span>=
</div><div><span style=3D"color:rgb(212,212,212)">        find </span><span=
 style=3D"color:rgb(156,220,254)">${IMAGE_ROOTFS}</span><span style=3D"colo=
r:rgb(212,212,212)"> -mtime -</span><span style=3D"color:rgb(156,220,254)">=
$DAYS_SINCE_BUILD</span><span style=3D"color:rgb(212,212,212)"> -exec touch=
 -h --date=3D@</span><span style=3D"color:rgb(156,220,254)">$REPRODUCIBLE_T=
IMESTAMP_ROOTFS</span><span style=3D"color:rgb(212,212,212)"> {} </span><sp=
an style=3D"color:rgb(215,186,125)">\;</span></div><div><span style=3D"colo=
r:rgb(212,212,212)">    </span><span style=3D"color:rgb(197,134,192)">fi</s=
pan></div><div><span style=3D"color:rgb(212,212,212)">}</span></div></div><=
/div></div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Tue, Dec 1, 2020 at 12:16 PM Ross Burton &lt;<a href=3D"mailto:=
ross@burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Tue, 1 Dec 2020 at 15:45, Richard =
Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank=
">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; I&#39;m not convinced this is correct as it could mess up the timesta=
mps of<br>
&gt; stamps set in other recipes?<br>
&gt;<br>
&gt; It&#39;s also tar specific and should really be across all image type=
s?<br>
<br>
Yes, it most likely should be done at rootfs time instead.<br>
<br>
Ross<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000006664b05b56f7358--
