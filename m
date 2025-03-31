Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1533BC36014
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 20:44:37 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.3349.1743453875391166495
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 13:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OU82UfPO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4394a823036so45931835e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 13:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743453874; x=1744058674; darn=lists.openembedded.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ndy4oFs2XN3FpIPp8FMq9DS9SJUp5kTKvCIChRcLTNQ=;
        b=OU82UfPOcafe8oTanuAdANsdgLN/Zn2zkuG/1Aw4hq1eXh9AxlUFV8KLHvqHmVopGC
         IumC+SULZvrC8F0ktEC5QVui83it8yGvXL7Ul6P64Pr/z7/JoeUutZaUG5tHbpJuxz+k
         X3cOD36/7dVqnrTLmIkrWeCtkBdJ395iKXWFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743453874; x=1744058674;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ndy4oFs2XN3FpIPp8FMq9DS9SJUp5kTKvCIChRcLTNQ=;
        b=SMYEAwfjym1l/xCgLmco86soG9PVCe9txrn03JTFvCzSpm/SwXW5Ysj+8Ljtq/UnCB
         97X0e0eHkk87ISKXSnL6+za7+QvJoTtqQgXEuAL3QLHBspXL4mNzhtfTNROZ1WPa6eva
         AJ1j7X4fV143oTj17k1DTwEZwf70rdiOpnvcmPccxQ8KBvkwwBAISp7sBsBPhlU7n3Py
         i67UQQwRaAMvs73NNigDgIIIKIwECv8nGfRYc+y1ytGTCRyuhtY5jdDQ8H6T47KqQP8R
         nKPgjm2P9L0ptfjgEcHuAJ13EZ1W19bJ+DigNlDaEd1O8mMuEpeGQ+H94GJvkAd+F+MS
         0/TA==
X-Gm-Message-State: AOJu0Yyyt9e9H2UKrC3K8r35hMcOmgWrTX1BGvo44myHC6lrTv9/8Hbv
	q/fIbYX4CaFUh/qPKnPFBzAGDB0IBTf1O78qcJUdisy+spdV0sd42BSMY4eEAo8=
X-Gm-Gg: ASbGncueCWcSMikjp+U6uN27nBfob7xGh78TOGSR2aues10ICAMcyfyp6UbsojBXhfb
	WjQf5YFa+y0VYv4fq7XEhqECnyTqrs7zeL1aXlru9Y+Eq5//scrO49UjIe7UNDLCympb71ILNJt
	w0z8neUer92nRIh5J9OHJBpGTmRBCqOIkNlGrrTAruIQ8eCX3HdnBM0jFkfd0PR2BpNONfcOO+l
	ZeNIiegmMiJbb8Ms6rchqy2RMsFFDLqRwKxpw3d/VDLNTkfjXlHDiW9C6mHM0hzZpaL5fjDhK7u
	MfCwyjYIOJo4MwOdekUc4UngiAW93UjK9yClhQQY+0hBtbERG+CnRzg3ZXKnN4zn9ENPTVXt//r
	BNnGm0VAYzBiOfnAMLLDed1QRa6nfVhwYUfboAwox1NIH
X-Google-Smtp-Source: AGHT+IE+Ys3wO2lB79+62B5f3bA0sHGPj7O2n+YTstDY/hLfdobLRbLlfx0J4mOgVX/tW9W0oyW/fQ==
X-Received: by 2002:a05:600c:34d0:b0:43c:ec0a:ddfd with SMTP id 5b1f17b1804b1-43db61e0308mr85448205e9.6.1743453873630;
        Mon, 31 Mar 2025 13:44:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6d6e:8a56:fa3e:c2d4? ([2001:8b0:aba:5f3c:6d6e:8a56:fa3e:c2d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82dede21sm175458845e9.4.2025.03.31.13.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 13:44:32 -0700 (PDT)
Message-ID: <0ea0d9782099022b7a663c94a46cc346ded45e28.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust-llvm: Compile llvm to use dynamic
 libraries
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, raj.khem@gmail.com, 
 "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, "Shinde, Yash"
 <yash.shinde@windriver.com>, Deepesh Varatharajan	
 <Deepesh.Varatharajan@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 31 Mar 2025 21:44:29 +0100
In-Reply-To: <9fe3cc25-c6fc-410a-b819-58e1e1db818e@windriver.com>
References: <20250331133044.1944108-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1sr8AqkmjQca6fYe90oOU3h=++A2=7RpaWkRFEuS38oyHg@mail.gmail.com>
	 <9fe3cc25-c6fc-410a-b819-58e1e1db818e@windriver.com>
Content-Type: multipart/alternative; boundary="=-3EIGGJ9Yg5IOAG71Ez1L"
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 20:44:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213996

--=-3EIGGJ9Yg5IOAG71Ez1L
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2025-03-31 at 15:08 -0400, Randy MacLeod wrote:
> =20
> On 2025-03-31 12:13 p.m., Khem Raj via lists.openembedded.org wrote:
> > On Mon, Mar 31, 2025 at 6:30=E2=80=AFAM Richard Purdie via
> > lists.openembedded.org
> > <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> > > Our main llvm recipe uses dynamic linking already but rust-llvm
> > > does not.
> > > Enabling this significanly reduces the size of llvm-rust to about
> > > a third
> > > of what it was, which is a bettter configuration for us leading
> > > to smaller
> > > TMPDIR and sstate objects
> > >=20
> > =20
> >=20
> > =20
> > =20
> > It will slow down the compiler execution and sometimes its could be
> > significant as well we have seen this with clang so it would be
> > good to have some idea around that least we provide a slow compiler
> > compared to other distro infrastructures=20
> > =20
> > =20
> > =20
> =20
> We'll get some performance info from the YP AB perf builds.

https://valkyrie.yocto.io/pub/non-release/20250331-105/testresults/buildper=
f-debian11/perf-debian12-vk_master-next_20250331181527_9ba5b4f4e4.html
https://valkyrie.yocto.io/pub/non-release/20250331-104/testresults/buildper=
f-alma8/perf-alma8-vk_master-next_20250331181513_9ba5b4f4e4.html

The build time is fractionally faster (1%?) but hard to say within
noise.

The diskspace drop is convincing, 2.3GB less TMPDIR size (2.3%).

The rm_work TMPDIR size also drops by 1GB (6%) which is particularly
significant and nice to have.

In builds with rust-llvm as well as rust-llvm-native, this will double
up for a double win.

Cheers,

Richard

--=-3EIGGJ9Yg5IOAG71Ez1L
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head>

  <style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head>
  <body><div>On Mon, 2025-03-31 at 15:08 -0400, Randy MacLeod wrote:</div><=
blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fc=
f solid;padding-left:1ex"><div> </div><div class=3D"moz-cite-prefix">On 202=
5-03-31 12:13 p.m., Khem Raj via lists.openembedded.org wrote:<br> </div><b=
lockquote type=3D"cite" cite=3D"mid:CAMKF1sr8AqkmjQca6fYe90oOU3h=3D++A2=3D7=
RpaWkRFEuS38oyHg@mail.gmail.com" style=3D"margin:0 0 0 .8ex; border-left:2p=
x #729fcf solid;padding-left:1ex"><div>On Mon, Mar 31, 2025 at 6:30=E2=80=
=AFAM Richard Purdie via <a href=3D"http://lists.openembedded.org" moz-do-n=
ot-send=3D"true">lists.openembedded.org</a> &lt;richard.purdie=3D<a href=3D=
"mailto:linuxfoundation.org@lists.openembedded.org" moz-do-not-send=3D"true=
" class=3D"moz-txt-link-freetext">linuxfoundation.org@lists.openembedded.or=
g</a>&gt; wrote:</div><div><div class=3D"gmail_quote gmail_quote_container"=
><blockquote dir=3D"auto" type=3D"cite" style=3D"margin:0 0 0 .8ex; border-=
left:2px #729fcf solid;padding-left:1ex"><div>Our main llvm recipe uses dyn=
amic linking already but rust-llvm does not.<br> Enabling this significanly=
 reduces the size of llvm-rust to about a third<br> of what it was, which i=
s a bettter configuration for us leading to smaller<br> TMPDIR and sstate o=
bjects</div><br></blockquote> <div dir=3D"auto"><br> </div> <div dir=3D"aut=
o">It will slow down the compiler execution and sometimes its could be sign=
ificant as well we have seen this with clang so it would be good to have so=
me idea around that least we provide a slow compiler compared to other dist=
ro infrastructures <br> </div> </div> </div><div> </div></blockquote><div> =
</div><p>We'll get some performance info from the YP AB perf builds.</p></b=
lockquote><div><br></div><div><a href=3D"https://valkyrie.yocto.io/pub/non-=
release/20250331-105/testresults/buildperf-debian11/perf-debian12-vk_master=
-next_20250331181527_9ba5b4f4e4.html">https://valkyrie.yocto.io/pub/non-rel=
ease/20250331-105/testresults/buildperf-debian11/perf-debian12-vk_master-ne=
xt_20250331181527_9ba5b4f4e4.html</a></div><div><a href=3D"https://valkyrie=
.yocto.io/pub/non-release/20250331-104/testresults/buildperf-alma8/perf-alm=
a8-vk_master-next_20250331181513_9ba5b4f4e4.html">https://valkyrie.yocto.io=
/pub/non-release/20250331-104/testresults/buildperf-alma8/perf-alma8-vk_mas=
ter-next_20250331181513_9ba5b4f4e4.html</a></div><div><br></div><div>The bu=
ild time is fractionally faster (1%?) but hard to say within noise.</div><d=
iv><br></div><div>The diskspace drop is convincing, 2.3GB less TMPDIR size =
(2.3%).</div><div><br></div><div>The rm_work TMPDIR size also drops by 1GB =
(6%) which is particularly significant and nice to have.</div><div><br></di=
v><div>In builds with rust-llvm as well as rust-llvm-native, this will doub=
le up for a double win.</div><div><br></div><div>Cheers,</div><div><br></di=
v><div>Richard</div><div><span></span></div></body></html>

--=-3EIGGJ9Yg5IOAG71Ez1L--

