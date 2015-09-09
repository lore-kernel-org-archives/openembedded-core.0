Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6CA787669F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 15:45:41 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so17370294igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 08:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=tErRyIDLZvjzQyrBo5gdppGKXS4jqWZhZ1OWjUh8gQo=;
	b=QbkDY738sDbRF1t+DsTPt2b6qVOliCaisZ8Nz/JSo3bT6vpKu6v5/2NnUOTIqLBJ+U
	87i8q2nN0ciBf69WB0H8ygiD01pnQH+vqDmuejpo9N3JxIAgEDJ77BvuMYLWFSAUD/Se
	xRw1nYVt9VnNmrR95T3Wmdl9qrmfxwD3MZbW8WQIr3NTVhW2GmGeDykHwNGTNPB5H2V6
	F0qS7FZpuA4FbPFnV5ZK3XCMWl4c9AWXa+xnqY5v+xQLsrQmMy5KXFjFl1WAP8BQ79BS
	gaKlMuF09yYXryFgAalspiN3RfMZXvLk3+55nxwwwhYOpbeyp2bJOIJ8KApdwsSWXeGC
	Vtzw==
X-Received: by 10.50.43.170 with SMTP id x10mr51406484igl.68.1441813541395;
	Wed, 09 Sep 2015 08:45:41 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.71 with HTTP; Wed, 9 Sep 2015 08:45:22 -0700 (PDT)
In-Reply-To: <55F02841.6000209@topic.nl>
References: <1441800588-25217-1-git-send-email-ross.burton@intel.com>
	<55F02841.6000209@topic.nl>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 9 Sep 2015 08:45:22 -0700
X-Google-Sender-Auth: b372ZJ-QT4yOcY7gKVDfnG60ZWU
Message-ID: <CABcZANmL4xJbs1yctpMX2jXoUBojCuQ+waD-+Qr=hzosGWMPpw@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ptest: fix file ownerships in ${PTEST_PATH}
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
X-List-Received-Date: Wed, 09 Sep 2015 15:45:42 -0000
Content-Type: multipart/alternative; boundary=089e01176cadf7a360051f525fc3

--089e01176cadf7a360051f525fc3
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 9, 2015 at 5:38 AM, Mike Looijmans <mike.looijmans@topic.nl>
wrote:

> Just posting a related idea here:
>
> There are quite a few recipes that just contain a bunch of (data) files,
> and use a simple "cp -r" in the install phase. Instead of peppering these
> with "chown" calls, it might be better to create a small utility that
> basically runs the "install" command recursively, and replace the "cp -r"
> with "install_recursive".
>

Something like that doesn't seem unreasonable, so the classes/recipes don't
have to worry about the particulars of the recursive copy tool being used.

That said, doesn't cp -r result in correct ownership, since the files are
created without preserving permissions or ownership? I'm pretty sure it's
the cp -a / cp -pPr that we need to be more concerned with.

Note that with gnu cp, it's possible to tell it to preserve permissions,
but not ownership. It's not portable to non-gnu cp, but I don't know what
we care about that anyway.

Ex.: `cp -a --no-preserve=ownership`
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e01176cadf7a360051f525fc3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Sep 9, 2015 at 5:38 AM, Mike Looijmans <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:mike.looijmans@topic.nl" target=3D"_blank">mike.looijmans@topic=
.nl</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2ah=
" class=3D"a3s" style=3D"overflow:hidden">Just posting a related idea here:=
<br>
<br>
There are quite a few recipes that just contain a bunch of (data) files, an=
d use a simple &quot;cp -r&quot; in the install phase. Instead of peppering=
 these with &quot;chown&quot; calls, it might be better to create a small u=
tility that basically runs the &quot;install&quot; command recursively, and=
 replace the &quot;cp -r&quot; with &quot;install_recursive&quot;.<span cla=
ss=3D""><br></span></div></blockquote></div><br>Something like that doesn&#=
39;t seem unreasonable, so the classes/recipes don&#39;t have to worry abou=
t the particulars of the recursive copy tool being used.</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">That said, doesn&#39;t c=
p -r result in correct ownership, since the files are created without prese=
rving permissions or ownership? I&#39;m pretty sure it&#39;s the cp -a / cp=
 -pPr that we need to be more concerned with.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Note that with gnu cp, it&#39;s pos=
sible to tell it to preserve permissions, but not ownership. It&#39;s not p=
ortable to non-gnu cp, but I don&#39;t know what we care about that anyway.=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ex.: =
`cp -a --no-preserve=3Downership`<br>-- <br><div class=3D"gmail_signature">=
Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, Open=
Embedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Men=
tor Graphics</div>
</div></div>

--089e01176cadf7a360051f525fc3--
