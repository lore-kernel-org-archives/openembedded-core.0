Return-Path: <rich@richelberger.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E883C05027
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 20:52:01 +0000 (UTC)
Received: from a48-183.smtp-out.amazonses.com (a48-183.smtp-out.amazonses.com [54.240.48.183])
 by mx.groups.io with SMTP id smtpd.web11.5640.1676839914997495454
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 12:51:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@richelberger.com header.s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd header.b=kAbCURWA;
 spf=pass (domain: amazonses.com, ip: 54.240.48.183, mailfrom: 010001866b728a08-b73e8eb7-d21f-4286-acbc-3573f7ad35e9-000000@amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd; d=richelberger.com;
	t=1676839914;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
	bh=JSuwnru+T2IqtJi9YoZTnJX/QO5TOxqMytwjrr8/01A=;
	b=kAbCURWAL28mYjpqvBr2VoJBh0n7PI3ZfOyk9aOzb+gvHRjoCY95mzClJKSz6vVi
	li/OmYisnfVsjzqB9IGXqY/19ONDZyo273RHWaPVEOrFaVVmVptnPrFe/ziCCxoDZRo
	cQttyw8h87E2VNG15R2ifh03WwH5QhYAd8JwlKv4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1676839914;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
	bh=JSuwnru+T2IqtJi9YoZTnJX/QO5TOxqMytwjrr8/01A=;
	b=XveWWjcmdF7roDB98R7tmwNzMS5EZ4u0ajhlwEQBG3W8X+flzUXAOmcnjCPx1YAB
	9FETZzuCGUGh4DxLXUnmae/IH28GaU5mqIHdPF8mBZqli7znUOcFJH3pyec8kfs6zWk
	lapjtIalZnDMk2J3jNgJBfpnR45+nH/pp/L3fRqE=
Subject: Re: [OE-core] [PATCH] [YOCTO #13270] Refactor the docbook-xml recipe
 to use docbook.org packages rather than hacked up debian package
From: =?UTF-8?Q?Richard_Elberger?= <rich@richelberger.com>
To: =?UTF-8?Q?Alexander_Kanavin?= <alex.kanavin@gmail.com>
Cc: =?UTF-8?Q?openembedded-core=40lists=2Eopenembedded=2Eorg?=
  <openembedded-core@lists.openembedded.org>
Date: Sun, 19 Feb 2023 20:51:53 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: 
 <CANNYZj83GH1=vHN1D3PcdXDTnq45122_2BLrdgp7=o8cAjMLHA@mail.gmail.com>
References: <20230219112522.3391653-2-rich@richelberger.com> 
 <CANNYZj_PtQ4yVdy1XspGKKAmZE4Mgfmm8D+5gf6D8mGMrc36ng@mail.gmail.com> 
 <010001866a8456a4-0d51027d-5588-4b3e-af46-9e09b84cfe2f-000000@email.amazonses.com> 
 <1e455822-8e68-5e30-72b8-c4c1d18acb48@richelberger.com> 
 <CANNYZj8ejnyhpF9UBaHr6=CVZNxVNxjjQmpdxkut9oH0i33AjQ@mail.gmail.com> 
 <010001866ae9a28c-9050cb24-ba3f-4a9b-b8c5-a00bc936efbf-000000@email.amazonses.com> 
 <17454DD71A4E7B0B.32742@lists.openembedded.org> 
 <2b4a87bc-d5ca-800f-852f-414070ed31ff@richelberger.com> 
 <CANNYZj9+6uQjy=5+rWfYBBmzfwJQHB4YNWH3-DAEunB+mdrinw@mail.gmail.com> 
 <010001866b5c73fa-530eb0cc-1137-4ccf-8ee7-aff4434b46ea-000000@email.amazonses.com> 
 <eba0a002-efcb-3bde-e46d-d88c07bc9b2c@richelberger.com> 
 <CANNYZj8kF=W8LBP7zyyYRrJiPUkxcaXqxc87PBiQCBXu1ksNTA@mail.gmail.com> 
 <010001866b6d0a7c-d5d7db67-d8a0-421b-bdda-e1b7130bbaae-000000@email.amazonses.com> 
 <CANNYZj83GH1=vHN1D3PcdXDTnq45122_2BLrdgp7=o8cAjMLHA@mail.gmail.com> 
 <5a8a36d3-d915-a111-d0a4-a74297596981@richelberger.com>
X-Mailer: Amazon WorkMail
Thread-Index: =?us-ascii?Q?AQHZRFTceYTVX42QQdWyqJeuPsKmTgAAAJI5AAlad9wADM7?=
 =?us-ascii?Q?9pwAPsApoABNZtUMAE6UtCQATyIGx?=
Thread-Topic: [OE-core] [PATCH] [YOCTO #13270] Refactor the docbook-xml
 recipe to use docbook.org packages rather than hacked up debian package
X-Wm-Sent-Timestamp: 1676839912
Message-ID: <010001866b728a08-b73e8eb7-d21f-4286-acbc-3573f7ad35e9-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2023.02.19-54.240.48.183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 20:52:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177387

It is working --- and I don't see how the prior one could have been=20=0D=
=0Aupgraded at all because it was a debian snapshot package=0D=0A=0D=0A=0D=
=0Arpcme@proteus:~/elinux/oe-core/meta/recipes-devtools$ devtool=20=0D=0A=
latest-version docbook-xml-dtd4=0D=0ANOTE: Starting bitbake server...=0D=0A=
NOTE: Reconnecting to bitbake server...=0D=0ANOTE: Retrying server connec=
tion (#1)... (15:50:43.295558)=0D=0ALoading cache: 100% |################=
############################| Time:=20=0D=0A0:00:00=0D=0ALoaded 1692 entr=
ies from dependency cache.=0D=0A--2023-02-19 15:50:45--=C2=A0 https://doc=
book.org/xml/=0D=0AResolving docbook.org (docbook.org)... 18.213.222.111,=
 35.229.48.116=0D=0AConnecting to docbook.org (docbook.org)|18.213.222.11=
1|:443... connected.=0D=0AHTTP request sent, awaiting response... 200 OK=0D=
=0ALength: 3929 (3.8K) [text/html]=0D=0ASaving to: =E2=80=98/tmp/wget-ind=
ex-8i8d6pca/wget-listing-8wiusk7e=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15=
:50:45 (17.8 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-index-8i8d6pca/wget-listi=
ng-8wiusk7e=E2=80=99 saved [3929/3929]=0D=0A=0D=0A--2023-02-19 15:50:45--=
=C2=A0 https://docbook.org/xml/4.1.2/=0D=0AResolving docbook.org (docbook=
=2Eorg)... 18.213.222.111, 35.229.48.116=0D=0AConnecting to docbook.org (=
docbook.org)|18.213.222.111|:443... connected.=0D=0AHTTP request sent, aw=
aiting response... 200 OK=0D=0ALength: 2092 (2.0K) [text/html]=0D=0ASavin=
g to: =E2=80=98/tmp/wget-index-999ij1ye/wget-listing-_3t72jiq=E2=80=99=0D=
=0A=0D=0A=0D=0A2023-02-19 15:50:45 (15.1 MB/s) -=20=0D=0A=E2=80=98/tmp/wg=
et-index-999ij1ye/wget-listing-_3t72jiq=E2=80=99 saved [2092/2092]=0D=0A=0D=
=0A--2023-02-19 15:50:45--=C2=A0 https://docbook.org/xml/4.2/=0D=0AResolv=
ing docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116=0D=0AConne=
cting to docbook.org (docbook.org)|18.213.222.111|:443... connected.=0D=0A=
HTTP request sent, awaiting response... 200 OK=0D=0ALength: 2154 (2.1K) [=
text/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-s2n3hz3o/wget-listing=
-_f4795l_=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50:45 (14.5 MB/s) -=20=0D=
=0A=E2=80=98/tmp/wget-index-s2n3hz3o/wget-listing-_f4795l_=E2=80=99 saved=
 [2154/2154]=0D=0A=0D=0A--2023-02-19 15:50:45--=C2=A0 https://docbook.org=
/xml/4.3/=0D=0AResolving docbook.org (docbook.org)... 18.213.222.111, 35.=
229.48.116=0D=0AConnecting to docbook.org (docbook.org)|18.213.222.111|:4=
43... connected.=0D=0AHTTP request sent, awaiting response... 200 OK=0D=0A=
Length: 2202 (2.2K) [text/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-=
raeil465/wget-listing-p6j4dk72=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50=
:45 (15.2 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-index-raeil465/wget-listing-=
p6j4dk72=E2=80=99 saved [2202/2202]=0D=0A=0D=0A--2023-02-19 15:50:46--=C2=
=A0 https://docbook.org/xml/4.3/=0D=0AResolving docbook.org (docbook.org)=
=2E.. 18.213.222.111, 35.229.48.116=0D=0AConnecting to docbook.org (docbo=
ok.org)|18.213.222.111|:443... connected.=0D=0AHTTP request sent, awaitin=
g response... 200 OK=0D=0ALength: 2202 (2.2K) [text/html]=0D=0ASaving to:=
 =E2=80=98/tmp/wget-index-3horis1c/wget-listing-fn4pbojo=E2=80=99=0D=0A=0D=
=0A=0D=0A2023-02-19 15:50:46 (14.8 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-ind=
ex-3horis1c/wget-listing-fn4pbojo=E2=80=99 saved [2202/2202]=0D=0A=0D=0A-=
-2023-02-19 15:50:46--=C2=A0 https://docbook.org/xml/4.3/=0D=0AResolving =
docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116=0D=0AConnectin=
g to docbook.org (docbook.org)|18.213.222.111|:443... connected.=0D=0AHTT=
P request sent, awaiting response... 200 OK=0D=0ALength: 2202 (2.2K) [tex=
t/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-dsnyvowx/wget-listing-uw=
t3tfa2=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50:46 (10.2 MB/s) -=20=0D=0A=
=E2=80=98/tmp/wget-index-dsnyvowx/wget-listing-uwt3tfa2=E2=80=99 saved [2=
202/2202]=0D=0A=0D=0A--2023-02-19 15:50:46--=C2=A0 https://docbook.org/xm=
l/4.3/=0D=0AResolving docbook.org (docbook.org)... 18.213.222.111, 35.229=
=2E48.116=0D=0AConnecting to docbook.org (docbook.org)|18.213.222.111|:44=
3... connected.=0D=0AHTTP request sent, awaiting response... 200 OK=0D=0A=
Length: 2202 (2.2K) [text/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-=
x2f9ft64/wget-listing-vmk7cdck=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50=
:46 (15.9 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-index-x2f9ft64/wget-listing-=
vmk7cdck=E2=80=99 saved [2202/2202]=0D=0A=0D=0A--2023-02-19 15:50:46--=C2=
=A0 https://docbook.org/xml/4.3/=0D=0AResolving docbook.org (docbook.org)=
=2E.. 18.213.222.111, 35.229.48.116=0D=0AConnecting to docbook.org (docbo=
ok.org)|18.213.222.111|:443... connected.=0D=0AHTTP request sent, awaitin=
g response... 200 OK=0D=0ALength: 2202 (2.2K) [text/html]=0D=0ASaving to:=
 =E2=80=98/tmp/wget-index-b00vg6es/wget-listing-kgmlrhsa=E2=80=99=0D=0A=0D=
=0A=0D=0A2023-02-19 15:50:46 (15.5 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-ind=
ex-b00vg6es/wget-listing-kgmlrhsa=E2=80=99 saved [2202/2202]=0D=0A=0D=0A-=
-2023-02-19 15:50:47--=C2=A0 https://docbook.org/xml/4.3/=0D=0AResolving =
docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116=0D=0AConnectin=
g to docbook.org (docbook.org)|18.213.222.111|:443... connected.=0D=0AHTT=
P request sent, awaiting response... 200 OK=0D=0ALength: 2202 (2.2K) [tex=
t/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-5vc97isa/wget-listing-ef=
pcncoh=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50:47 (15.0 MB/s) -=20=0D=0A=
=E2=80=98/tmp/wget-index-5vc97isa/wget-listing-efpcncoh=E2=80=99 saved [2=
202/2202]=0D=0A=0D=0A--2023-02-19 15:50:47--=C2=A0 https://docbook.org/xm=
l/4.3/=0D=0AResolving docbook.org (docbook.org)... 18.213.222.111, 35.229=
=2E48.116=0D=0AConnecting to docbook.org (docbook.org)|18.213.222.111|:44=
3... connected.=0D=0AHTTP request sent, awaiting response... 200 OK=0D=0A=
Length: 2202 (2.2K) [text/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-=
xmml2m_y/wget-listing-bo6wqd4s=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50=
:47 (9.54 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-index-xmml2m_y/wget-listing-=
bo6wqd4s=E2=80=99 saved [2202/2202]=0D=0A=0D=0A--2023-02-19 15:50:47--=C2=
=A0 https://docbook.org/xml/4.3/=0D=0AResolving docbook.org (docbook.org)=
=2E.. 18.213.222.111, 35.229.48.116=0D=0AConnecting to docbook.org (docbo=
ok.org)|18.213.222.111|:443... connected.=0D=0AHTTP request sent, awaitin=
g response... 200 OK=0D=0ALength: 2202 (2.2K) [text/html]=0D=0ASaving to:=
 =E2=80=98/tmp/wget-index-am1fly7w/wget-listing-yqkw74hi=E2=80=99=0D=0A=0D=
=0A=0D=0A2023-02-19 15:50:47 (11.1 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-ind=
ex-am1fly7w/wget-listing-yqkw74hi=E2=80=99 saved [2202/2202]=0D=0A=0D=0A-=
-2023-02-19 15:50:47--=C2=A0 https://docbook.org/xml/4.4/=0D=0AResolving =
docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116=0D=0AConnectin=
g to docbook.org (docbook.org)|18.213.222.111|:443... connected.=0D=0AHTT=
P request sent, awaiting response... 200 OK=0D=0ALength: 2202 (2.2K) [tex=
t/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-staj0ksp/wget-listing-_u=
2l4jwn=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50:48 (16.2 MB/s) -=20=0D=0A=
=E2=80=98/tmp/wget-index-staj0ksp/wget-listing-_u2l4jwn=E2=80=99 saved [2=
202/2202]=0D=0A=0D=0A--2023-02-19 15:50:48--=C2=A0 https://docbook.org/xm=
l/4.4/=0D=0AResolving docbook.org (docbook.org)... 18.213.222.111, 35.229=
=2E48.116=0D=0AConnecting to docbook.org (docbook.org)|18.213.222.111|:44=
3... connected.=0D=0AHTTP request sent, awaiting response... 200 OK=0D=0A=
Length: 2202 (2.2K) [text/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-=
gwqtkhi_/wget-listing-jtlali9r=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50=
:48 (14.4 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-index-gwqtkhi_/wget-listing-=
jtlali9r=E2=80=99 saved [2202/2202]=0D=0A=0D=0A--2023-02-19 15:50:48--=C2=
=A0 https://docbook.org/xml/4.4/=0D=0AResolving docbook.org (docbook.org)=
=2E.. 18.213.222.111, 35.229.48.116=0D=0AConnecting to docbook.org (docbo=
ok.org)|18.213.222.111|:443... connected.=0D=0AHTTP request sent, awaitin=
g response... 200 OK=0D=0ALength: 2202 (2.2K) [text/html]=0D=0ASaving to:=
 =E2=80=98/tmp/wget-index-2rclefoo/wget-listing-k4gmz4vo=E2=80=99=0D=0A=0D=
=0A=0D=0A2023-02-19 15:50:48 (13.8 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-ind=
ex-2rclefoo/wget-listing-k4gmz4vo=E2=80=99 saved [2202/2202]=0D=0A=0D=0A-=
-2023-02-19 15:50:48--=C2=A0 https://docbook.org/xml/4.4/=0D=0AResolving =
docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116=0D=0AConnectin=
g to docbook.org (docbook.org)|18.213.222.111|:443... connected.=0D=0AHTT=
P request sent, awaiting response... 200 OK=0D=0ALength: 2202 (2.2K) [tex=
t/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-hm3mgyno/wget-listing-kz=
bcd0pc=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50:48 (3.01 MB/s) -=20=0D=0A=
=E2=80=98/tmp/wget-index-hm3mgyno/wget-listing-kzbcd0pc=E2=80=99 saved [2=
202/2202]=0D=0A=0D=0A--2023-02-19 15:50:48--=C2=A0 https://docbook.org/xm=
l/4.4/=0D=0AResolving docbook.org (docbook.org)... 18.213.222.111, 35.229=
=2E48.116=0D=0AConnecting to docbook.org (docbook.org)|18.213.222.111|:44=
3... connected.=0D=0AHTTP request sent, awaiting response... 200 OK=0D=0A=
Length: 2202 (2.2K) [text/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-=
df5n44fh/wget-listing-rughmkj5=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50=
:49 (15.1 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-index-df5n44fh/wget-listing-=
rughmkj5=E2=80=99 saved [2202/2202]=0D=0A=0D=0A--2023-02-19 15:50:49--=C2=
=A0 https://docbook.org/xml/4.4/=0D=0AResolving docbook.org (docbook.org)=
=2E.. 18.213.222.111, 35.229.48.116=0D=0AConnecting to docbook.org (docbo=
ok.org)|18.213.222.111|:443... connected.=0D=0AHTTP request sent, awaitin=
g response... 200 OK=0D=0ALength: 2202 (2.2K) [text/html]=0D=0ASaving to:=
 =E2=80=98/tmp/wget-index-73ik2ylt/wget-listing-sp6a189r=E2=80=99=0D=0A=0D=
=0A=0D=0A2023-02-19 15:50:49 (15.2 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-ind=
ex-73ik2ylt/wget-listing-sp6a189r=E2=80=99 saved [2202/2202]=0D=0A=0D=0A-=
-2023-02-19 15:50:49--=C2=A0 https://docbook.org/xml/4.4/=0D=0AResolving =
docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116=0D=0AConnectin=
g to docbook.org (docbook.org)|18.213.222.111|:443... connected.=0D=0AHTT=
P request sent, awaiting response... 200 OK=0D=0ALength: 2202 (2.2K) [tex=
t/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-n8427qqd/wget-listing-rp=
7w_iim=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50:49 (11.2 MB/s) -=20=0D=0A=
=E2=80=98/tmp/wget-index-n8427qqd/wget-listing-rp7w_iim=E2=80=99 saved [2=
202/2202]=0D=0A=0D=0A--2023-02-19 15:50:49--=C2=A0 https://docbook.org/xm=
l/4.5/=0D=0AResolving docbook.org (docbook.org)... 18.213.222.111, 35.229=
=2E48.116=0D=0AConnecting to docbook.org (docbook.org)|18.213.222.111|:44=
3... connected.=0D=0AHTTP request sent, awaiting response... 200 OK=0D=0A=
Length: 2196 (2.1K) [text/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-=
7kg86ky5/wget-listing-pfq81o04=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50=
:49 (15.7 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-index-7kg86ky5/wget-listing-=
pfq81o04=E2=80=99 saved [2196/2196]=0D=0A=0D=0A--2023-02-19 15:50:49--=C2=
=A0 https://docbook.org/xml/4.5/=0D=0AResolving docbook.org (docbook.org)=
=2E.. 18.213.222.111, 35.229.48.116=0D=0AConnecting to docbook.org (docbo=
ok.org)|18.213.222.111|:443... connected.=0D=0AHTTP request sent, awaitin=
g response... 200 OK=0D=0ALength: 2196 (2.1K) [text/html]=0D=0ASaving to:=
 =E2=80=98/tmp/wget-index-5kcb1cwx/wget-listing-y4s7rbeb=E2=80=99=0D=0A=0D=
=0A=0D=0A2023-02-19 15:50:50 (14.7 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-ind=
ex-5kcb1cwx/wget-listing-y4s7rbeb=E2=80=99 saved [2196/2196]=0D=0A=0D=0A-=
-2023-02-19 15:50:50--=C2=A0 https://docbook.org/xml/4.5/=0D=0AResolving =
docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116=0D=0AConnectin=
g to docbook.org (docbook.org)|18.213.222.111|:443... connected.=0D=0AHTT=
P request sent, awaiting response... 200 OK=0D=0ALength: 2196 (2.1K) [tex=
t/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-e9uiwezl/wget-listing-ga=
ak4fjf=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50:50 (14.3 MB/s) -=20=0D=0A=
=E2=80=98/tmp/wget-index-e9uiwezl/wget-listing-gaak4fjf=E2=80=99 saved [2=
196/2196]=0D=0A=0D=0A--2023-02-19 15:50:50--=C2=A0 https://docbook.org/xm=
l/4.5/=0D=0AResolving docbook.org (docbook.org)... 18.213.222.111, 35.229=
=2E48.116=0D=0AConnecting to docbook.org (docbook.org)|18.213.222.111|:44=
3... connected.=0D=0AHTTP request sent, awaiting response... 200 OK=0D=0A=
Length: 2196 (2.1K) [text/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-=
ijwig4kk/wget-listing-ubz8ihck=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50=
:50 (13.9 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-index-ijwig4kk/wget-listing-=
ubz8ihck=E2=80=99 saved [2196/2196]=0D=0A=0D=0A--2023-02-19 15:50:50--=C2=
=A0 https://docbook.org/xml/4.5/=0D=0AResolving docbook.org (docbook.org)=
=2E.. 18.213.222.111, 35.229.48.116=0D=0AConnecting to docbook.org (docbo=
ok.org)|18.213.222.111|:443... connected.=0D=0AHTTP request sent, awaitin=
g response... 200 OK=0D=0ALength: 2196 (2.1K) [text/html]=0D=0ASaving to:=
 =E2=80=98/tmp/wget-index-23wg3ce1/wget-listing-po35ctnw=E2=80=99=0D=0A=0D=
=0A=0D=0A2023-02-19 15:50:50 (10.7 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-ind=
ex-23wg3ce1/wget-listing-po35ctnw=E2=80=99 saved [2196/2196]=0D=0A=0D=0A-=
-2023-02-19 15:50:50--=C2=A0 https://docbook.org/xml/5.0/=0D=0AResolving =
docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116=0D=0AConnectin=
g to docbook.org (docbook.org)|18.213.222.111|:443... connected.=0D=0AHTT=
P request sent, awaiting response... 200 OK=0D=0ALength: 1935 (1.9K) [tex=
t/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-xbl8kski/wget-listing-lz=
oxc4q7=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50:51 (12.9 MB/s) -=20=0D=0A=
=E2=80=98/tmp/wget-index-xbl8kski/wget-listing-lzoxc4q7=E2=80=99 saved [1=
935/1935]=0D=0A=0D=0A--2023-02-19 15:50:51--=C2=A0 https://docbook.org/xm=
l/5.0.1/=0D=0AResolving docbook.org (docbook.org)... 18.213.222.111, 35.2=
29.48.116=0D=0AConnecting to docbook.org (docbook.org)|18.213.222.111|:44=
3... connected.=0D=0AHTTP request sent, awaiting response... 200 OK=0D=0A=
Length: 1879 (1.8K) [text/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-=
1witmxd3/wget-listing-7rjy2_0c=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50=
:51 (16.5 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-index-1witmxd3/wget-listing-=
7rjy2_0c=E2=80=99 saved [1879/1879]=0D=0A=0D=0A--2023-02-19 15:50:51--=C2=
=A0 https://docbook.org/xml/5.1/=0D=0AResolving docbook.org (docbook.org)=
=2E.. 18.213.222.111, 35.229.48.116=0D=0AConnecting to docbook.org (docbo=
ok.org)|18.213.222.111|:443... connected.=0D=0AHTTP request sent, awaitin=
g response... 200 OK=0D=0ALength: 1670 (1.6K) [text/html]=0D=0ASaving to:=
 =E2=80=98/tmp/wget-index-95v7zmwh/wget-listing-o2ffmje6=E2=80=99=0D=0A=0D=
=0A=0D=0A2023-02-19 15:50:52 (9.94 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-ind=
ex-95v7zmwh/wget-listing-o2ffmje6=E2=80=99 saved [1670/1670]=0D=0A=0D=0A-=
-2023-02-19 15:50:52--=C2=A0 https://docbook.org/xml/5.1/=0D=0AResolving =
docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116=0D=0AConnectin=
g to docbook.org (docbook.org)|18.213.222.111|:443... connected.=0D=0AHTT=
P request sent, awaiting response... 200 OK=0D=0ALength: 1670 (1.6K) [tex=
t/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-j6t46pnp/wget-listing-23=
4d878_=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50:52 (11.5 MB/s) -=20=0D=0A=
=E2=80=98/tmp/wget-index-j6t46pnp/wget-listing-234d878_=E2=80=99 saved [1=
670/1670]=0D=0A=0D=0A--2023-02-19 15:50:52--=C2=A0 https://docbook.org/xm=
l/5.1/=0D=0AResolving docbook.org (docbook.org)... 18.213.222.111, 35.229=
=2E48.116=0D=0AConnecting to docbook.org (docbook.org)|18.213.222.111|:44=
3... connected.=0D=0AHTTP request sent, awaiting response... 200 OK=0D=0A=
Length: 1670 (1.6K) [text/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-=
g3qisiyq/wget-listing-c6dbllr4=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50=
:52 (7.47 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-index-g3qisiyq/wget-listing-=
c6dbllr4=E2=80=99 saved [1670/1670]=0D=0A=0D=0A--2023-02-19 15:50:52--=C2=
=A0 https://docbook.org/xml/5.1/=0D=0AResolving docbook.org (docbook.org)=
=2E.. 18.213.222.111, 35.229.48.116=0D=0AConnecting to docbook.org (docbo=
ok.org)|18.213.222.111|:443... connected.=0D=0AHTTP request sent, awaitin=
g response... 200 OK=0D=0ALength: 1670 (1.6K) [text/html]=0D=0ASaving to:=
 =E2=80=98/tmp/wget-index-x3___c7x/wget-listing-c5ect7a3=E2=80=99=0D=0A=0D=
=0A=0D=0A2023-02-19 15:50:52 (10.2 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-ind=
ex-x3___c7x/wget-listing-c5ect7a3=E2=80=99 saved [1670/1670]=0D=0A=0D=0A-=
-2023-02-19 15:50:52--=C2=A0 https://docbook.org/xml/5.1/=0D=0AResolving =
docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116=0D=0AConnectin=
g to docbook.org (docbook.org)|18.213.222.111|:443... connected.=0D=0AHTT=
P request sent, awaiting response... 200 OK=0D=0ALength: 1670 (1.6K) [tex=
t/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-p4qpvb0k/wget-listing-e4=
7qjey4=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50:53 (10.6 MB/s) -=20=0D=0A=
=E2=80=98/tmp/wget-index-p4qpvb0k/wget-listing-e47qjey4=E2=80=99 saved [1=
670/1670]=0D=0A=0D=0A--2023-02-19 15:50:53--=C2=A0 https://docbook.org/xm=
l/5.1/=0D=0AResolving docbook.org (docbook.org)... 18.213.222.111, 35.229=
=2E48.116=0D=0AConnecting to docbook.org (docbook.org)|18.213.222.111|:44=
3... connected.=0D=0AHTTP request sent, awaiting response... 200 OK=0D=0A=
Length: 1670 (1.6K) [text/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-=
7q9ewbfv/wget-listing-7uupe9yj=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50=
:53 (12.6 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-index-7q9ewbfv/wget-listing-=
7uupe9yj=E2=80=99 saved [1670/1670]=0D=0A=0D=0A--2023-02-19 15:50:53--=C2=
=A0 https://docbook.org/xml/5.1/=0D=0AResolving docbook.org (docbook.org)=
=2E.. 18.213.222.111, 35.229.48.116=0D=0AConnecting to docbook.org (docbo=
ok.org)|18.213.222.111|:443... connected.=0D=0AHTTP request sent, awaitin=
g response... 200 OK=0D=0ALength: 1670 (1.6K) [text/html]=0D=0ASaving to:=
 =E2=80=98/tmp/wget-index-608vlaw2/wget-listing-94cdcy4s=E2=80=99=0D=0A=0D=
=0A=0D=0A2023-02-19 15:50:53 (11.6 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-ind=
ex-608vlaw2/wget-listing-94cdcy4s=E2=80=99 saved [1670/1670]=0D=0A=0D=0A-=
-2023-02-19 15:50:53--=C2=A0 https://docbook.org/xml/5.1/=0D=0AResolving =
docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116=0D=0AConnectin=
g to docbook.org (docbook.org)|18.213.222.111|:443... connected.=0D=0AHTT=
P request sent, awaiting response... 200 OK=0D=0ALength: 1670 (1.6K) [tex=
t/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-7xlvffk3/wget-listing-t1=
45lptl=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50:53 (11.7 MB/s) -=20=0D=0A=
=E2=80=98/tmp/wget-index-7xlvffk3/wget-listing-t145lptl=E2=80=99 saved [1=
670/1670]=0D=0A=0D=0A--2023-02-19 15:50:53--=C2=A0 https://docbook.org/xm=
l/5.1/=0D=0AResolving docbook.org (docbook.org)... 18.213.222.111, 35.229=
=2E48.116=0D=0AConnecting to docbook.org (docbook.org)|18.213.222.111|:44=
3... connected.=0D=0AHTTP request sent, awaiting response... 200 OK=0D=0A=
Length: 1670 (1.6K) [text/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-=
xoc60_3a/wget-listing-6tj2x2b2=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50=
:53 (11.4 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-index-xoc60_3a/wget-listing-=
6tj2x2b2=E2=80=99 saved [1670/1670]=0D=0A=0D=0A--2023-02-19 15:50:54--=C2=
=A0 https://docbook.org/xml/5.1/=0D=0AResolving docbook.org (docbook.org)=
=2E.. 18.213.222.111, 35.229.48.116=0D=0AConnecting to docbook.org (docbo=
ok.org)|18.213.222.111|:443... connected.=0D=0AHTTP request sent, awaitin=
g response... 200 OK=0D=0ALength: 1670 (1.6K) [text/html]=0D=0ASaving to:=
 =E2=80=98/tmp/wget-index-c3ad8634/wget-listing-lif1thj_=E2=80=99=0D=0A=0D=
=0A=0D=0A2023-02-19 15:50:54 (10.2 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-ind=
ex-c3ad8634/wget-listing-lif1thj_=E2=80=99 saved [1670/1670]=0D=0A=0D=0A-=
-2023-02-19 15:50:54--=C2=A0 https://docbook.org/xml/5.1/=0D=0AResolving =
docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116=0D=0AConnectin=
g to docbook.org (docbook.org)|18.213.222.111|:443... connected.=0D=0AHTT=
P request sent, awaiting response... 200 OK=0D=0ALength: 1670 (1.6K) [tex=
t/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-w95mnrrr/wget-listing-3y=
2adbj2=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50:54 (11.5 MB/s) -=20=0D=0A=
=E2=80=98/tmp/wget-index-w95mnrrr/wget-listing-3y2adbj2=E2=80=99 saved [1=
670/1670]=0D=0A=0D=0A--2023-02-19 15:50:54--=C2=A0 https://docbook.org/xm=
l/5.1/=0D=0AResolving docbook.org (docbook.org)... 18.213.222.111, 35.229=
=2E48.116=0D=0AConnecting to docbook.org (docbook.org)|18.213.222.111|:44=
3... connected.=0D=0AHTTP request sent, awaiting response... 200 OK=0D=0A=
Length: 1670 (1.6K) [text/html]=0D=0ASaving to: =E2=80=98/tmp/wget-index-=
q5kqy628/wget-listing-3puydl8g=E2=80=99=0D=0A=0D=0A=0D=0A2023-02-19 15:50=
:54 (10.2 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-index-q5kqy628/wget-listing-=
3puydl8g=E2=80=99 saved [1670/1670]=0D=0A=0D=0A--2023-02-19 15:50:54--=C2=
=A0 https://docbook.org/xml/5.1/=0D=0AResolving docbook.org (docbook.org)=
=2E.. 18.213.222.111, 35.229.48.116=0D=0AConnecting to docbook.org (docbo=
ok.org)|18.213.222.111|:443... connected.=0D=0AHTTP request sent, awaitin=
g response... 200 OK=0D=0ALength: 1670 (1.6K) [text/html]=0D=0ASaving to:=
 =E2=80=98/tmp/wget-index-hb8by0i3/wget-listing-uag1u2jt=E2=80=99=0D=0A=0D=
=0A=0D=0A2023-02-19 15:50:54 (11.3 MB/s) -=20=0D=0A=E2=80=98/tmp/wget-ind=
ex-hb8by0i3/wget-listing-uag1u2jt=E2=80=99 saved [1670/1670]=0D=0A=0D=0A-=
-2023-02-19 15:50:55--=C2=A0 https://docbook.org/xml/5.2/=0D=0AResolving =
docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116=0D=0AConnectin=
g to docbook.org (docbook.org)|18.213.222.111|:443... connected.=0D=0AHTT=
P request sent, awaiting response... 404 Not Found=0D=0A2023-02-19 15:50:=
55 ERROR 404: Not Found.=0D=0A=0D=0A--2023-02-19 15:50:55--=C2=A0 https:/=
/docbook.org/xml/5.2/=0D=0AResolving docbook.org (docbook.org)... 18.213.=
222.111, 35.229.48.116=0D=0AConnecting to docbook.org (docbook.org)|18.21=
3.222.111|:443... connected.=0D=0AHTTP request sent, awaiting response...=
 404 Not Found=0D=0A2023-02-19 15:50:55 ERROR 404: Not Found.=0D=0A=0D=0A=
--2023-02-19 15:50:55--=C2=A0 https://docbook.org/xml/5.2/=0D=0AResolving=
 docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116=0D=0AConnecti=
ng to docbook.org (docbook.org)|18.213.222.111|:443... connected.=0D=0AHT=
TP request sent, awaiting response... 404 Not Found=0D=0A2023-02-19 15:50=
:55 ERROR 404: Not Found.=0D=0A=0D=0A--2023-02-19 15:50:55--=C2=A0 https:=
//docbook.org/xml/5.2/=0D=0AResolving docbook.org (docbook.org)... 18.213=
=2E222.111, 35.229.48.116=0D=0AConnecting to docbook.org (docbook.org)|18=
=2E213.222.111|:443... connected.=0D=0AHTTP request sent, awaiting respon=
se... 404 Not Found=0D=0A2023-02-19 15:50:55 ERROR 404: Not Found.=0D=0A=0D=
=0A--2023-02-19 15:50:56--=C2=A0 https://docbook.org/xml/5.2/=0D=0AResolv=
ing docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116=0D=0AConne=
cting to docbook.org (docbook.org)|18.213.222.111|:443... connected.=0D=0A=
HTTP request sent, awaiting response... 404 Not Found=0D=0A2023-02-19 15:=
50:56 ERROR 404: Not Found.=0D=0A=0D=0A--2023-02-19 15:50:56--=C2=A0 http=
s://docbook.org/xml/5.2/=0D=0AResolving docbook.org (docbook.org)... 18.2=
13.222.111, 35.229.48.116=0D=0AConnecting to docbook.org (docbook.org)|18=
=2E213.222.111|:443... connected.=0D=0AHTTP request sent, awaiting respon=
se... 404 Not Found=0D=0A2023-02-19 15:50:56 ERROR 404: Not Found.=0D=0A=0D=
=0A--2023-02-19 15:50:56--=C2=A0 https://docbook.org/xml/5.2/=0D=0AResolv=
ing docbook.org (docbook.org)... 18.213.222.111, 35.229.48.116=0D=0AConne=
cting to docbook.org (docbook.org)|18.213.222.111|:443... connected.=0D=0A=
HTTP request sent, awaiting response... 404 Not Found=0D=0A2023-02-19 15:=
50:56 ERROR 404: Not Found.=0D=0A=0D=0A--2023-02-19 15:50:56--=C2=A0 http=
s://docbook.org/xml/5.2/=0D=0AResolving docbook.org (docbook.org)... 18.2=
13.222.111, 35.229.48.116=0D=0AConnecting to docbook.org (docbook.org)|18=
=2E213.222.111|:443... connected.=0D=0AHTTP request sent, awaiting respon=
se... 404 Not Found=0D=0A2023-02-19 15:50:56 ERROR 404: Not Found.=0D=0A=0D=
=0AINFO: Current version: 4.5=0D=0AINFO: Latest version: 412=0D=0Arpcme@p=
roteus:~/elinux/oe-core/meta/recipes-devtools$ echo $=3F=0D=0A0=0D=0A=0D=0A=
=0D=0AOn 2/19/23 15:47, Alexander Kanavin wrote:=0D=0A> The version check=
 is working fine with the existing recipe, and it=0D=0A> will stop workin=
g with your patch. So you need to get it fixed.=0D=0A>=0D=0A> Alex=0D=0A>=
=0D=0A> On Sun, 19 Feb 2023 at 21:45, Richard Elberger <rich@richelberger=
=2Ecom> wrote:=0D=0A>> I think doing this is out of scope of the bugfix. =
The latest-version=0D=0A>> check was not a constraint in the prior versio=
n.=0D=0A>>=0D=0A>> I suggest that we get the bug fixed and file another w=
orkitem for this=0D=0A>> particular ask.=0D=0A>>=0D=0A>> On 2/19/23 15:39=
, Alexander Kanavin wrote:=0D=0A>>> 412 can be specifically excluded as a=
 'bogus' version, examples exist=0D=0A>>> in oe-core.=0D=0A>>>=0D=0A>>> V=
ersion checks are used for manual upgrades too, as maintainers want=0D=0A=
>>> to be notified there's a new version, even if autoupgrade can't handl=
e=0D=0A>>> it. We just need to know if there's a 4.x release newer than 4=
=2E5, and=0D=0A>>> that can be covered by the check.=0D=0A>>>=0D=0A>>> Al=
ex=0D=0A>>>=0D=0A>>> On Sun, 19 Feb 2023 at 21:27, Richard Elberger <rich=
@richelberger.com> wrote:=0D=0A>>>> I have been working on it, but after =
a while I realized that this=0D=0A>>>> version upgrade will not work anyw=
ay - even for 4.x=0D=0A>>>>=0D=0A>>>> The reason is they have a folder na=
med "412" which is actually 4.1.2=0D=0A>>>> which I we probably still nee=
d to have in.=0D=0A>>>>=0D=0A>>>> Even though the tool cannot find 5.2 it=
 still exits zero ... but still,=0D=0A>>>> it thinks that 412 > 5.2=0D=0A=
>>>>=0D=0A>>>> I see one of two things a/ do not autoupgrade and somehow =
mark for=0D=0A>>>> manual cyclical update b/ somehow apply a map capabili=
ty=0D=0A>>>>=0D=0A>>>> Also given that multiple versions must be delivere=
d in the same version=0D=0A>>>> I don't think that this falls under typic=
al autoupgrade scenario.=0D=0A>>>>=0D=0A>>>> What are your thoughts=3F=0D=
=0A>>>>=0D=0A>>>> On 2/19/23 13:54, Alexander Kanavin wrote:=0D=0A>>>>> I=
f the check goes over https://docbook.org/xml/ I guess you can set=0D=0A>=
>>>> the regex to 4.x versions only, as the recipe name itself pins it to=
=0D=0A>>>>> 4.x. I'm not sure we're even going to need 5.x, ever.=0D=0A>>=
>>> You can grep for UPSTREAM_CHECK_REGEX in core for examples.=0D=0A>>>>=
>=0D=0A>>>>> Alex=0D=0A>>>>>=0D=0A>>>>> On Sun, 19 Feb 2023 at 19:40, Ale=
xander Kanavin via=0D=0A>>>>> lists.openembedded.org <alex.kanavin=3Dgmai=
l.com@lists.openembedded.org>=0D=0A>>>>> wrote:=0D=0A>>>>>> It helps if y=
ou provide devtool's output. I think it's possible to=0D=0A>>>>>> exclude=
 rc versions from the check with UPSTREAM_CHECK_REGEX.=0D=0A>>>>>>=0D=0A>=
>>>>> Alex=0D=0A>>>>>>=0D=0A>>>>>> On Sun, 19 Feb 2023 at 19:22, Richard =
Elberger <rich@richelberger.com> wrote:=0D=0A>>>>>>> I tried `devtool lat=
est-version` and it failed on one version - 5.2 -=0D=0A>>>>>>> because it=
's still in RC.=0D=0A>>>>>>>=0D=0A>>>>>>> Note that there are massive bre=
aking changes between Docbook 4x and 5x.=0D=0A>>>>>>> Given the defect I'=
m fixing is to change the upstream source - and not=0D=0A>>>>>>> refactor=
 the entire recipe - I believe the scope should keep to that and=0D=0A>>>=
>>>> another defect filed for future versions. Please confirm this is=0D=0A=
>>>>>>> reasonable.=0D=0A>>>>>>>=0D=0A>>>>>>> I did the other beatificati=
on changes per style guide and will resubmit=0D=0A>>>>>>> once I get conf=
irmation.=0D=0A>>>>>>>=0D=0A>>>>>>> On 2/19/23 12:31, Alexander Kanavin w=
rote:=0D=0A>>>>>>>> On Sun, 19 Feb 2023 at 17:31, Richard Elberger <rich@=
richelberger.com> wrote:=0D=0A>>>>>>>>=0D=0A>>>>>>>>> For multiple assign=
ment: the reason is maintainability. The supported=0D=0A>>>>>>>>> version=
s will change over time.=0D=0A>>>>>>>> You can still place them in a newl=
ine-separated single assignment,=0D=0A>>>>>>>> which is a lot more readab=
le as the list of fetched items is then in a=0D=0A>>>>>>>> single locatio=
n in the recipe.=0D=0A>>>>>>>> This is how all recipes in oe-core are str=
uctured.=0D=0A>>>>>>>>=0D=0A>>>>>>>>> Please confirm if there are any oth=
er appreciations I must cover - I was=0D=0A>>>>>>>>> unaware of this one =
and would like to batch them. If the appreciations=0D=0A>>>>>>>>> are lis=
ted on a wiki please school me about that.=0D=0A>>>>>>>> For now I do not=
 have any others. I'd like to see a v2 first, as v1=0D=0A>>>>>>>> makes i=
t hard to understand how the final recipe looks like with the=0D=0A>>>>>>=
>> multiple SRC_URI approach. We used to have a bot that points out=0D=0A=
>>>>>>>> common issues but it's unmaintained and falled into disrepair.=0D=
=0A>>>>>>>>=0D=0A>>>>>>>> There are numerous pages on the wiki collecting=
 style and message tips:=0D=0A>>>>>>>> https://www.openembedded.org/wiki/=
Styleguide=0D=0A>>>>>>>> https://www.openembedded.org/wiki/Commit_Patch_M=
essage_Guidelines=0D=0A>>>>>>>> https://www.openembedded.org/wiki/How_to_=
submit_a_patch_to_OpenEmbedded=0D=0A>>>>>>>>=0D=0A>>>>>>>> Alex=0D=0A>>>>=
>>>>=0D=0A>>>>>>>>> On 2/19/23 10:52, Alexander Kanavin wrote:=0D=0A>>>>>=
>>>>> Can you please set SRC_URI with a single assignment; there is no=0D=
=0A>>>>>>>>>> reason to +=3D it multiple times.=0D=0A>>>>>>>>>>=0D=0A>>>>=
>>>>>> Verifying that 'devtool latest-version works' would be also apprec=
iated.=0D=0A>>>>>>>>>>=0D=0A>>>>>>>>>> Alex=0D=0A>>>>>>>>>>=0D=0A>>>>>>>>=
>> On Sun, 19 Feb 2023 at 12:25, Richard Elberger <rich@richelberger.com>=
 wrote:=0D=0A>>>>>>>>>>> ---=0D=0A>>>>>>>>>>>       .../docbook-xml/docbo=
ok-xml-dtd4_4.5.bb       | 74 ++++++++++++-------=0D=0A>>>>>>>>>>>       =
1 file changed, 49 insertions(+), 25 deletions(-)=0D=0A>>>>>>>>>>>=0D=0A>=
>>>>>>>>>> diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd=
4_4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb=0D=0A=
>>>>>>>>>>> index 2bec1442af..71aa8c14ec 100644=0D=0A>>>>>>>>>>> --- a/me=
ta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb=0D=0A>>>>>>>>>>> =
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb=0D=0A>>>>=
>>>>>>> @@ -1,30 +1,54 @@=0D=0A>>>>>>>>>>>       SUMMARY =3D "Document ty=
pe definitions for verification of XML data files"=0D=0A>>>>>>>>>>>      =
 DESCRIPTION =3D "Document type definitions for verification of XML data =
\=0D=0A>>>>>>>>>>> -files against the DocBook rule set, it ships with the=
 latest DocBook 4.5 \=0D=0A>>>>>>>>>>> -XML DTD, as well as a selected se=
t of legacy DTDs for use with older \=0D=0A>>>>>>>>>>> -documents, includ=
ing 4.0, 4.1.2, 4.2, 4.3 and 4.4"=0D=0A>>>>>>>>>>> -HOMEPAGE =3D "http://=
www.docbook.org/xml/"=0D=0A>>>>>>>>>>> +files against the DocBook rule se=
t."=0D=0A>>>>>>>>>>> +HOMEPAGE =3D "https://docbook.org"=0D=0A>>>>>>>>>>>=
=0D=0A>>>>>>>>>>> -LICENSE =3D "OASIS"=0D=0A>>>>>>>>>>> -LIC_FILES_CHKSUM=
 =3D "file://${WORKDIR}/LICENSE-OASIS;md5=3Dc608985dd5f7f215e669e7639a0b1=
d2e"=0D=0A>>>>>>>>>>> +inherit allarch=0D=0A>>>>>>>>>>> +BBCLASSEXTEND =3D=
 "native"=0D=0A>>>>>>>>>>>=0D=0A>>>>>>>>>>> -# Note: the upstream sources=
 are not distributed with a license file.=0D=0A>>>>>>>>>>> -# LICENSE-OAS=
IS is included as a "patch" to workaround this. When=0D=0A>>>>>>>>>>> -# =
upgrading this recipe, please verify whether this is still needed.=0D=0A>=
>>>>>>>>>> -SRC_URI =3D "http://snapshot.debian.org/archive/debian/201607=
28T043443Z/pool/main/d/docbook-xml/docbook-xml_${PV}.orig.tar.gz \=0D=0A>=
>>>>>>>>>> -           file://LICENSE-OASIS \=0D=0A>>>>>>>>>>> -         =
  file://docbook-xml-update-catalog.xml.patch \=0D=0A>>>>>>>>>>> -"=0D=0A=
>>>>>>>>>>> +# To support apps with xml schema backward compatibility, we=
 must=0D=0A>>>>>>>>>>> +# install a set of schemas. Install the latest ba=
sed on PV and then=0D=0A>>>>>>>>>>> +# name any specific versions as requ=
ired. TODO: Figure out a mechanism=0D=0A>>>>>>>>>>> +# to filter exactly =
which versions are necessary, if that's even=0D=0A>>>>>>>>>>> +# possible=
=2E=0D=0A>>>>>>>>>>> +#=0D=0A>>>>>>>>>>> +# DocBook.org lists available p=
ackages at https://docbook.org/xml/=0D=0A>>>>>>>>>>> +#=0D=0A>>>>>>>>>>> =
+# These packages are available as source but it requires the ability=0D=0A=
>>>>>>>>>>> +# to use the Gradle build system to do so. It might be safer=
 to use=0D=0A>>>>>>>>>>> +# the source tree which would also enable prope=
r SBOM generation=0D=0A>>>>>>>>>>> +# through the bitbake build system. h=
ttps://github.com/docbook/docbook=0D=0A>>>>>>>>>>> +#=0D=0A>>>>>>>>>>>=0D=
=0A>>>>>>>>>>> -SRC_URI[md5sum] =3D "487b4d44e15cffb1f4048af23f98208e"=0D=
=0A>>>>>>>>>>> -SRC_URI[sha256sum] =3D "b0f8edcf697f5318e63dd98c9a931f3fe=
e167af0805ba441db372e0f17b2a44f"=0D=0A>>>>>>>>>>> +S =3D "${WORKDIR}"=0D=0A=
>>>>>>>>>>>=0D=0A>>>>>>>>>>> -UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/ma=
in/d/docbook-xml/"=0D=0A>>>>>>>>>>> +SRC_URI +=3D "https://docbook.org/xm=
l/4.1.2/docbkx412.zip;name=3Dpayload412;subdir=3Ddocbook-xml-4.1.2"=0D=0A=
>>>>>>>>>>> +SRC_URI[payload412.md5sum] =3D "900d7609fb7e6d78901b357e4acf=
bc17"=0D=0A>>>>>>>>>>> +SRC_URI[payload412.sha256sum] =3D "30f0644064e0ea=
71751438251940b1431f46acada814a062870f486c772e7772"=0D=0A>>>>>>>>>>>=0D=0A=
>>>>>>>>>>> -S =3D "${WORKDIR}/docbook-xml-4.5.c31424"=0D=0A>>>>>>>>>>> +=
SRC_URI +=3D "https://docbook.org/xml/4.2/docbook-xml-4.2.zip;name=3Dpayl=
oad42;subdir=3Ddocbook-xml-4.2"=0D=0A>>>>>>>>>>> +SRC_URI[payload42.md5su=
m] =3D "73fe50dfe74ca631c1602f558ed8961f"=0D=0A>>>>>>>>>>> +SRC_URI[paylo=
ad42.sha256sum] =3D "acc4601e4f97a196076b7e64b368d9248b07c7abf26b34a02cca=
40eeebe60fa2"=0D=0A>>>>>>>>>>>=0D=0A>>>>>>>>>>> -inherit allarch=0D=0A>>>=
>>>>>>>> -BBCLASSEXTEND =3D "native"=0D=0A>>>>>>>>>>> +SRC_URI +=3D "http=
s://docbook.org/xml/4.3/docbook-xml-4.3.zip;name=3Dpayload43;subdir=3Ddoc=
book-xml-4.3"=0D=0A>>>>>>>>>>> +SRC_URI[payload43.md5sum] =3D "ab200202b9=
e136a144db1e0864c45074"=0D=0A>>>>>>>>>>> +SRC_URI[payload43.sha256sum] =3D=
 "23068a94ea6fd484b004c5a73ec36a66aa47ea8f0d6b62cc1695931f5c143464"=0D=0A=
>>>>>>>>>>> +=0D=0A>>>>>>>>>>> +SRC_URI +=3D "https://docbook.org/xml/4.4=
/docbook-xml-4.4.zip;name=3Dpayload44;subdir=3Ddocbook-xml-4.4"=0D=0A>>>>=
>>>>>>> +SRC_URI[payload44.md5sum] =3D "cbb04e9a700955d88c50962ef22c1634"=
=0D=0A>>>>>>>>>>> +SRC_URI[payload44.sha256sum] =3D "02f159eb88c4254d95e8=
31c51c144b1863b216d909b5ff45743a1ce6f5273090"=0D=0A>>>>>>>>>>> +=0D=0A>>>=
>>>>>>>> +SRC_URI +=3D "https://docbook.org/xml/${PV}/docbook-xml-${PV}.z=
ip;name=3DpayloadPV;subdir=3Ddocbook-xml-${PV}"=0D=0A>>>>>>>>>>> +SRC_URI=
[payloadPV.md5sum] =3D "03083e288e87a7e829e437358da7ef9e"=0D=0A>>>>>>>>>>=
> +SRC_URI[payloadPV.sha256sum] =3D "4e4e037a2b83c98c6c94818390d4bdd3f6e1=
0f6ec62dd79188594e26190dc7b4"=0D=0A>>>>>>>>>>> +=0D=0A>>>>>>>>>>> +# The =
upstream sources are not distributed with a license file.=0D=0A>>>>>>>>>>=
> +# LICENSE-OASIS is included as a "patch" to workaround this. When=0D=0A=
>>>>>>>>>>> +# upgrading this recipe, please verify whether this is still=
 needed.=0D=0A>>>>>>>>>>> +=0D=0A>>>>>>>>>>> +LICENSE =3D "OASIS"=0D=0A>>=
>>>>>>>>> +LIC_FILES_CHKSUM =3D "file://${WORKDIR}/LICENSE-OASIS;md5=3Dc6=
08985dd5f7f215e669e7639a0b1d2e"=0D=0A>>>>>>>>>>> +SRC_URI +=3D "file://LI=
CENSE-OASIS"=0D=0A>>>>>>>>>>>=0D=0A>>>>>>>>>>>       do_configure (){=0D=0A=
>>>>>>>>>>>           :=0D=0A>>>>>>>>>>> @@ -34,19 +58,19 @@ do_compile (=
){=0D=0A>>>>>>>>>>>           :=0D=0A>>>>>>>>>>>       }=0D=0A>>>>>>>>>>>=
=0D=0A>>>>>>>>>>> +inherit xmlcatalog=0D=0A>>>>>>>>>>> +=0D=0A>>>>>>>>>>>=
       do_install () {=0D=0A>>>>>>>>>>>           install -d ${D}${syscon=
fdir}/xml/=0D=0A>>>>>>>>>>>           xmlcatalog --create --noout ${D}${s=
ysconfdir}/xml/docbook-xml.xml=0D=0A>>>>>>>>>>>=0D=0A>>>>>>>>>>> -    for=
 DTDVERSION in 4.0 4.1.2 4.2 4.3 4.4 4.5; do=0D=0A>>>>>>>>>>> +    for DT=
DVERSION in 4.1.2 4.2 4.3 4.4 4.5; do=0D=0A>>>>>>>>>>>               DEST=
=3D${datadir}/xml/docbook/schema/dtd/$DTDVERSION=0D=0A>>>>>>>>>>>        =
       install -d -m 755 ${D}$DEST=0D=0A>>>>>>>>>>> -        cp -v -R doc=
book-$DTDVERSION/* ${D}$DEST=0D=0A>>>>>>>>>>> -        xmlcatalog --verbo=
se --noout --add nextCatalog unused file://$DEST/catalog.xml ${D}${syscon=
fdir}/xml/docbook-xml.xml=0D=0A>>>>>>>>>>> +        cp -v -R docbook-xml-=
$DTDVERSION/* ${D}$DEST=0D=0A>>>>>>>>>>> +        xmlcatalog --verbose --=
noout --add nextCatalog unused \=0D=0A>>>>>>>>>>> +          file://$DEST=
/catalog.xml ${D}${sysconfdir}/xml/docbook-xml.xml=0D=0A>>>>>>>>>>>      =
     done=0D=0A>>>>>>>>>>>       }=0D=0A>>>>>>>>>>>=0D=0A>>>>>>>>>>> -XML=
CATALOGS =3D "${sysconfdir}/xml/docbook-xml.xml"=0D=0A>>>>>>>>>>> -inheri=
t xmlcatalog=0D=0A>>>>>>>>>>> -=0D=0A>>>>>>>>>>>       FILES:${PN} =3D "$=
{datadir}/* ${sysconfdir}/xml/docbook-xml.xml"=0D=0A>>>>>>>>>>> --=0D=0A>=
>>>>>>>>>> 2.34.1=0D=0A>>>>>>>>>>>=0D=0A>>>>>>>>>>>=0D=0A>>>>>>>>>>>=0D=0A=
>>>>>>>>>>>=0D=0A>>>>>>>>>>>=0D=0A>>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=0D=0A>>>>>> Links: You receive all messages sent to this gr=
oup.=0D=0A>>>>>> View/Reply Online (#177342): https://lists.openembedded.=
org/g/openembedded-core/message/177342=0D=0A>>>>>> Mute This Topic: https=
://lists.openembedded.org/mt/97064586/1686489=0D=0A>>>>>> Group Owner: op=
enembedded-core+owner@lists.openembedded.org=0D=0A>>>>>> Unsubscribe: htt=
ps://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail=
=2Ecom]=0D=0A>>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=0D=0A>>=
>>>>=0D=0A

