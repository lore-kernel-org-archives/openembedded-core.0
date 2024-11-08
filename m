Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC7ED5C0D2
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 14:49:35 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.14389.1731077364955634632
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 06:49:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EU5GpCJk;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53c78ebe580so3492290e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 06:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731077363; x=1731682163; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RHSCSXWPyRqirH68QsRpk02Q0HJfLyYotUIAPiRa0PY=;
        b=EU5GpCJkluznXfRo6L2NNXp2ROhiR8jFGcJ6YRs1OwIMPVjH8qqGpFlUbxEt51D1ga
         6dHo0DNsQ+wfi001SQCWDV4OFFlW+S7s5WdzkBSI8cL6AKbe2Ki9P0hblsnhIoWMIvMi
         Teo/mOrjFtleirSsljOU4sJ+jxHqOYS0/he4ngVx8HY2k8i9wiCkiWdpv2yPoGbdo1RE
         Egbf44wSLVRaDNy4Fr8odEev1kS1Hqjqyk3J07OW1pY9KgbERasuzWazOSjd7nJ0jiF9
         VFenFHpvhAq62YFhJLuCOKsBGdbNFOfMGgU2kCZxDhfvJI0voQ3iLab6QIeHm0krGqg9
         PVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731077363; x=1731682163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHSCSXWPyRqirH68QsRpk02Q0HJfLyYotUIAPiRa0PY=;
        b=tyFkn0SCu/UF2KVc1ucSVfDkp+KskBpYqYxUmkBagFx5dSUd/jecLxNrXPujUuOzA+
         ffHilzoOZsONJpDa3lqLoTw8BL61dcfMOfnkmy3iT2smhw/JbdQaICv+S4slNs0DO8OA
         JmD1XvpnMASPq6RvVRw7gJ78Rx/nEquYfvloc3wxkCjncQSl1LazhRS8qhFLfoWoHikK
         ZscjhWu9z061+T30JUjyzUobarsO2pJ5B4EnvBVRcGsBsZJFQYqKvDPDBHtVi7QDGDFN
         xpRVdjhgfFHbXIIfpXrxaBD1aubOZ8IYnzAcx7h8WHj+vUo5hKtmIEV0bIKxD6VEdiQc
         +igA==
X-Gm-Message-State: AOJu0Yzw2AL7Ewz+I2tQ2TnIDyn3dnqtWBMx+aWXHxcu89Of2tI4QtBm
	5+Bel2/SUlurJSUgFIQ0xEQ3zrsLAClQVoBA1+erllDWpHlHImFxnpllKBQ2t8y2DndZQjKNqxg
	Om+64JVJVhYWWAgrS4dlkjuk0QGaaGg==
X-Google-Smtp-Source: AGHT+IF6HSrSPQqONhb1N/wXHHiWnsWNgFdMO1AkIM3Y0j7QM4ToqrZxlYvz0uw/iXMiC0xBeC2pNjIak1vz0XY3xjI=
X-Received: by 2002:a2e:bc8b:0:b0:2fb:5014:f03c with SMTP id
 38308e7fff4ca-2ff1f4326bamr14360381fa.5.1731077362750; Fri, 08 Nov 2024
 06:49:22 -0800 (PST)
MIME-Version: 1.0
References: <3611538.dWV9SEqChM@n9w6sw14> <CANNYZj_Gpnc39wmbOPUg6d27GtHssUyxxVvfJLy9-uPac6p3zw@mail.gmail.com>
 <2108179.YKUYFuaPT4@n9w6sw14>
In-Reply-To: <2108179.YKUYFuaPT4@n9w6sw14>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 Nov 2024 15:49:11 +0100
Message-ID: <CANNYZj9HHdmcd9Ve1S1h-H4yO3hry8PtehcQHDvcb6FG6-j6Rg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap] Preferred version for upgrading Glib
To: Christian Eggers <ceggers@arri.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000049243d062667dba6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 14:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206874

--00000000000049243d062667dba6
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Nov 2024 at 15:39, Christian Eggers <ceggers@arri.de> wrote:

> Hi Alex,
>
> On Friday, 8 November 2024, 11:46:03 CET, Alexander Kanavin wrote:
> > You can do anything you want in your private layers, but in public the
> > options are:
> > - backport the fixes
>
> I tried to backport them, but beside the mentioned merge request I
> need a number of other patches which feels like creating a zombie.
> Due to the complexity I cannot prove whether the result is valid.
>

Yes. This is the problem with LTS releases 'bugfixes only' policy that
cannot be easily resolved. Do you *have* to use scarthgap, or can you
transition to styhead?


> Would this help other users of Scarthgap? I thought that the mixin
> layers are intended to bring new features to a stable layer. But
> in this case there is a serious bug (race condition in the memory
> management routines) of a major piece of software. Every multi
> threaded application based on Glib is potentially affected. On
> my system it's NetworkManager, but I also read about Firefox.
>

LTS mixins isn't about new features. It's more about making it possible to
'opt into' potentially disruptive version upgrades. If such an upgrade
would land in oe-core scarthgap, users would have no choice. With LTS
mixins they have a choice: take the upgrade, or not. If the issues don't
affect them and they don't need new features, not taking the update is a
valid choice.

Anyway, you are welcome to prepare such an update for meta-lts-mixins.

Alex

--00000000000049243d062667dba6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, 8 Nov 2024 at 15:39, Christian Eggers &lt;<a href=3D"mailto:=
ceggers@arri.de">ceggers@arri.de</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div><div>Hi Alex,<br><br>On Friday, 8 Nov=
ember 2024, 11:46:03 CET, Alexander Kanavin wrote:<br>&gt; You can do anyth=
ing you want in your private layers, but in public the<br>&gt; options are:=
<br>&gt; - backport the fixes<br><br>I tried to backport them, but beside t=
he mentioned merge request I<br>need a number of other patches which feels =
like creating a zombie.<br>Due to the complexity I cannot prove whether the=
 result is valid.<br></div></div></blockquote><div><br></div><div>Yes. This=
 is the problem with LTS releases &#39;bugfixes only&#39; policy that canno=
t be easily resolved. Do you *have* to use scarthgap, or can you transition=
 to styhead?<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div><div>Would this help other users of Scarthgap? I thought=
 that the mixin <br>layers are intended to bring new features to a stable l=
ayer. But<br>in this case there is a serious bug (race condition in the mem=
ory<br>management routines) of a major piece of software. Every multi<br>th=
readed application based on Glib is potentially affected. On<br>my system i=
t&#39;s NetworkManager, but I also read about Firefox.<br></div></div></blo=
ckquote></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quot=
e">LTS mixins isn&#39;t about new features. It&#39;s more about making it p=
ossible to &#39;opt into&#39; potentially disruptive version upgrades. If s=
uch an upgrade would land in oe-core scarthgap, users would have no choice.=
 With LTS mixins they have a choice: take the upgrade, or not. If the issue=
s don&#39;t affect them and they don&#39;t need new features, not taking th=
e update is a valid choice.</div><div class=3D"gmail_quote"><br></div><div =
class=3D"gmail_quote">Anyway, you are welcome to prepare such an update for=
 meta-lts-mixins.</div><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">Alex<br></div></div>

--00000000000049243d062667dba6--

