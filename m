Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id D670471A54
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Mar 2017 09:40:36 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id g129so50672319qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Mar 2017 01:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=NkCRU0oOu7EUtswVDm+zJ2WMU3DvsGzocq6EzjiYQLs=;
	b=QM/h8TSywzZnIaIAo/xY+w+ni3YoxhdfVtfS4Y4rXVoO1NGJ675jXfj20HYMfAi9rP
	vGYCW67W+1gYrmy5baaSTFNxGvFtplS9sOBZdOuPkDuHrq1I5GkxXqeBlH+u4FnMqn+i
	5uyAHpsxpG98uJSGqCuG+9gPK14bJYt/ZwzUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=NkCRU0oOu7EUtswVDm+zJ2WMU3DvsGzocq6EzjiYQLs=;
	b=N6uQ3iMPoZ9FehLpAaG+Kh+/Y25+5Ep2jxT/9v85u3YWJe+lsV5OPjPTY/Qldd6Zix
	tPHeku1yqjfNdgc3zCFfFpNicImr6BbykoCHogoiE+CA1gsNN5Ow5PbONSyWeZnsBU+l
	+eVaC+iMHxy7HqPHK3rhxJ4C8Y0fYxC8vHspc5+tVrKFQNcpbbyghKFRGrTz+OZuczZW
	Q4DPYdaOa3qRJEJ24wFwiYVSBthPiBnPnV5OlSlkLIsE737P1ZZ2xFBxalR1E7XE9Viv
	ho4wDilt0mLZad77U9Yxmkv212phzPQk66BKRy/VhRMTpyQDdBrh2JKDIDaIOYrweHhz
	4sGA==
X-Gm-Message-State: AMke39kLCl23ZJhthLgIh4rDGJSH+fRTUXkUdUot8UxDe4go8jrGoUO/DQCMZ2mX5nZOOC/8tQltFYpML/narHoE
X-Received: by 10.237.33.46 with SMTP id 43mr11947652qtc.72.1488706837719;
	Sun, 05 Mar 2017 01:40:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.129 with HTTP; Sun, 5 Mar 2017 01:40:17 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Sun, 5 Mar 2017 10:40:17 +0100
Message-ID: <CAP71WjxRGB3L=iKN+LK2JTdO51oy10Vua-sg46E6MvOu+B52fQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: systemd and /etc/machine-id
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
X-List-Received-Date: Sun, 05 Mar 2017 09:40:38 -0000
Content-Type: multipart/alternative; boundary=94eb2c0c5fe23cc8f80549f892e4

--94eb2c0c5fe23cc8f80549f892e4
Content-Type: text/plain; charset=UTF-8

hi,

I am trying to understand why the systemd recipe creates an empty
/etc/machine-id file:

# Create machine-id

# 20:12 < mezcalero> koen: you have three options: a) run
systemd-machine-id-setup at install time, b) have / read-only and an empty
file there (for stateless) and c) boot with / writable
touch ${D}${sysconfdir}/machine-id

Having an empty machine-id file seems to prevent the "ConditionFirstBoot"
to be ever met, e.g. I have a service that tries to use it, and at first
boot i am seeing in systemctl status:

ConditionFirstBoot=yes was not met

However I also notice that /etc/machine-id is properly set during the first
boot (e.g. with a valid UID). I am not sure I understand our intent to
create an empty file. If I remove the empty file before flashing the board,
then my service which depends on ConditionFirstBoot is executed properly,
and becasue the systemd recipe also enables 'firstboot' by default (in
PACKAGECONFIG) then systemd-firstboot service is kicked as well, and ask
for hostname , TZ, .. (which isn't very convenient neither).

without understanding the entire history, I would tend to think that we
need the following changes to the systemd recipe:

1. remove the empty /etc/machine-id file
2. remove firstboot from default PACKAGECONFIG

any thoughts?

cheers
nico

--94eb2c0c5fe23cc8f80549f892e4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hi,<br><br>I am trying to understand why the systemd recip=
e creates an empty /etc/machine-id file:<br><br># Create machine-id =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br># 20:12 &=
lt; mezcalero&gt; koen: you have three options: a) run systemd-machine-id-s=
etup at install time, b) have / read-only and an empty file there (for stat=
eless) and c) boot with / writable<br>touch ${D}${sysconfdir}/machine-id<br=
><br>Having an empty machine-id file seems to prevent the &quot;ConditionFi=
rstBoot&quot; to be ever met, e.g. I have a service that tries to use it, a=
nd at first boot i am seeing in systemctl status:<br><br>ConditionFirstBoot=
=3Dyes was not met<div><br></div><div>However I also notice that /etc/machi=
ne-id is properly set during the first boot (e.g. with a valid UID). I am n=
ot sure I understand our intent to create an empty file. If I remove the em=
pty file before flashing the board, then my service which depends on Condit=
ionFirstBoot is executed properly, and becasue the systemd recipe also enab=
les &#39;firstboot&#39; by default (in PACKAGECONFIG) then systemd-firstboo=
t service is kicked as well, and ask for hostname , TZ, .. (which isn&#39;t=
 very convenient neither).</div><div><br></div><div>without understanding t=
he entire history, I would tend to think that we need the following changes=
 to the systemd recipe:</div><div><br></div><div>1. remove the empty /etc/m=
achine-id file</div><div>2. remove firstboot from default PACKAGECONFIG=C2=
=A0</div><div><br></div><div>any thoughts?</div><div><br></div><div>cheers<=
/div><div>nico</div></div>

--94eb2c0c5fe23cc8f80549f892e4--
