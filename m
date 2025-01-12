Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B507E77188
	for <webhook@archiver.kernel.org>; Sun, 12 Jan 2025 15:35:14 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.37718.1736696107966821148
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jan 2025 07:35:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U0vJFgMH;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53f757134cdso3495198e87.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 07:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736696106; x=1737300906; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hc3RRL6k0XnCY5rn1Fs5N3pSduoBrLLpKKGLURY1BM=;
        b=U0vJFgMHe0AvWi8RlZUIhul2rV/0QOSP/oJsuS4+ML2xd5t1P7ugSL2Ceg1f1LSUN/
         V/Fz0/wOI77wbb/ZTO/I4HONYHXJ/3TAKcUjEaVHrj5h+iQYL8AzTeTJQtc2F5cNC1EB
         njhppuftPUX1eVdk7QWGvYy4pTTKOmVhqPFDNAYYdcfcYcDwcbubSyBMBJdYurwyfjge
         jZHMnFt8TWuUCA5x94iABoC+SmO9L2V2m46NGvLXfZujduy74Bp81rotoMEthUO3c4/6
         UThsDri0GY5EstNz6cpvQQIbAOWNJKPwf49gvsk1lDQagDs754Hzl3StyeCPjz5Rq9xr
         PjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736696106; x=1737300906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hc3RRL6k0XnCY5rn1Fs5N3pSduoBrLLpKKGLURY1BM=;
        b=sdPxrjxWmNVdXPVdIILu1RdvG1tkqDotnfbVHBHcZvN/824dP2jOQAEDFBmeqSL99e
         7ZdX3VuDLaqzma7mQe48nHhFyGOFJWdS8iTGnm9y799olwcuCkH2tZ+AusIxVBmLWkyM
         /QEf0Jthe5jdckZi4LpicNlhujZd+itUJMD90dMZRgv+YwrJWANja//sU2UcewYCrsKx
         zxu8BKVL6C61dydbUf/iBolMBrwkWOG6FYaNSqrjRx2E72FdP3dhLcVidVz6zXls17r5
         1ZlOMt8kihgd5IHtCDcTwIIoO8JpNiNjIsUyIgfk8+VKW+U2ryvRMqZWuhAknftPuR0q
         UL6g==
X-Gm-Message-State: AOJu0YykIIS4bZELqJ2e9r/HDmB45dZN2r0hKbhp8rZqKG10uq0qnFir
	Mqkw8QRjveE2M6ctQUOfpvhP7OTE0Oy4OeEPlAbuQ4oMzh0RPVhFguxmAzTuirYM7hoyJeC/vzS
	tqY/NfCK/kkfn6ixQa0yKcKNAV/c=
X-Gm-Gg: ASbGncu2g1ce4WxPzQSFKBLdRHu77dAVGgY9V5Aug8mXfrc7VNFgiwAgscwGO1A0bSJ
	L004jhPGU8ncrhkeSX6OEhVQgQbF66Mj0OKOAZgoN79QluRNdbgk7i64JNCl3YanN3A==
X-Google-Smtp-Source: AGHT+IG8Riu6ZtXUxzEEib0DtDuu1OFTbyhVsstPT91xSOpYdHPRTQH9eu3JcVFypS6PoEd8sPuEXAg91OQFiIFwAFQ=
X-Received: by 2002:a05:6512:33c4:b0:542:2ee3:29dd with SMTP id
 2adb3069b0e04-542845b1ad7mr4925217e87.1.1736696105593; Sun, 12 Jan 2025
 07:35:05 -0800 (PST)
MIME-Version: 1.0
References: <20250112143141.1300189-1-arturkow2000@gmail.com> <20250112143141.1300189-2-arturkow2000@gmail.com>
In-Reply-To: <20250112143141.1300189-2-arturkow2000@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 12 Jan 2025 15:34:54 +0000
X-Gm-Features: AbW1kvZ1FYpfP1MKtLO0Qo2afI3orXmqjTAjZh9e0EmPWBjTrR1M9AWsmR7bmkc
Message-ID: <CAO5Uq5SJ8M3SBWB0WrkZZ8rE46J1XEMp45Ubtk-k4v5LgNALcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] systemd-systemctl: add support for --global flag
To: arturkow2000@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 15:35:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209697

On Sun, Jan 12, 2025 at 2:40=E2=80=AFPM Artur Kowalski via
lists.openembedded.org <arturkow2000=3Dgmail.com@lists.openembedded.org>
wrote:
>
> The flag is similar to --user flag as it causes systemctl to operate on
> user units, but it performs operations globally for all users. This is
> required to for user presets support.

"to for"? Drop the "to"?

>
> Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
> ---
>  .../systemd/systemd-systemctl/systemctl       | 42 ++++++++++---------
>  1 file changed, 23 insertions(+), 19 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta=
/recipes-core/systemd/systemd-systemctl/systemctl
> index 2229bc7b6d..9b8fe81459 100755
> --- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
> +++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> @@ -29,15 +29,15 @@ class SystemdFile():
>
>      _clearable_keys =3D ['WantedBy']
>
> -    def __init__(self, root, path, instance_unit_name):
> +    def __init__(self, root, path, instance_unit_name, unit_type):
>          self.sections =3D dict()
>          self._parse(root, path)
>          dirname =3D os.path.basename(path.name) + ".d"
>          for location in locations:
> -            files =3D (root / location / "system" / dirname).glob("*.con=
f")
> +            files =3D (root / location / unit_type / dirname).glob("*.co=
nf")
>              if instance_unit_name:
>                  inst_dirname =3D instance_unit_name + ".d"
> -                files =3D chain(files, (root / location / "system" / ins=
t_dirname).glob("*.conf"))
> +                files =3D chain(files, (root / location / unit_type / in=
st_dirname).glob("*.conf"))
>              for path2 in sorted(files):
>                  self._parse(root, path2)
>
> @@ -182,21 +182,22 @@ class SystemdUnitNotFoundError(Exception):
>
>
>  class SystemdUnit():
> -    def __init__(self, root, unit):
> +    def __init__(self, root, unit, unit_type):
>          self.root =3D root
>          self.unit =3D unit
> +        self.unit_type =3D unit_type
>          self.config =3D None
>
>      def _path_for_unit(self, unit):
>          for location in locations:
> -            path =3D self.root / location / "system" / unit
> +            path =3D self.root / location / self.unit_type / unit
>              if path.exists() or path.is_symlink():
>                  return path
>
>          raise SystemdUnitNotFoundError(self.root, unit)
>
>      def _process_deps(self, config, service, location, prop, dirstem, in=
stance):
> -        systemdir =3D self.root / SYSCONFDIR / "systemd" / "system"
> +        systemdir =3D self.root / SYSCONFDIR / "systemd" / self.unit_typ=
e
>
>          target =3D ROOT / location.relative_to(self.root)
>          try:
> @@ -229,7 +230,7 @@ class SystemdUnit():
>              # ignore aliases
>              return
>
> -        config =3D SystemdFile(self.root, path, instance_unit_name)
> +        config =3D SystemdFile(self.root, path, instance_unit_name, self=
.unit_type)
>          if instance =3D=3D "":
>              try:
>                  default_instance =3D config.get('Install', 'DefaultInsta=
nce')[0]
> @@ -250,14 +251,14 @@ class SystemdUnit():
>                  try:
>                       units_enabled.append(unit)
>                       if also not in units_enabled:
> -                        SystemdUnit(self.root, also).enable(units_enable=
d)
> +                        SystemdUnit(self.root, also, self.unit_type).ena=
ble(units_enabled)
>                  except SystemdUnitNotFoundError as e:
>                      sys.exit("Error: Systemctl also enable issue with  %=
s (%s)" % (service, e.unit))
>
>          except KeyError:
>              pass
>
> -        systemdir =3D self.root / SYSCONFDIR / "systemd" / "system"
> +        systemdir =3D self.root / SYSCONFDIR / "systemd" / self.unit_typ=
e
>          target =3D ROOT / path.relative_to(self.root)
>          try:
>              for dest in config.get('Install', 'Alias'):
> @@ -268,15 +269,15 @@ class SystemdUnit():
>              pass
>
>      def mask(self):
> -        systemdir =3D self.root / SYSCONFDIR / "systemd" / "system"
> +        systemdir =3D self.root / SYSCONFDIR / "systemd" / self.unit_typ=
e
>          add_link(systemdir / self.unit, "/dev/null")
>
>
> -def collect_services(root):
> +def collect_services(root, unit_type):
>      """Collect list of service files"""
>      services =3D set()
>      for location in locations:
> -        paths =3D (root / location / "system").glob("*")
> +        paths =3D (root / location / unit_type).glob("*")
>          for path in paths:
>              if path.is_dir():
>                  continue
> @@ -285,16 +286,16 @@ def collect_services(root):
>      return services
>
>
> -def preset_all(root):
> -    presets =3D Presets('system-preset', root)
> -    services =3D collect_services(root)
> +def preset_all(root, unit_type):
> +    presets =3D Presets('{}-preset'.format(unit_type), root)
> +    services =3D collect_services(root, unit_type)
>
>      for service in services:
>          state =3D presets.state(service)
>
>          if state =3D=3D "enable" or state is None:
>              try:
> -                SystemdUnit(root, service).enable()
> +                SystemdUnit(root, service, unit_type).enable()
>              except SystemdUnitNotFoundError:
>                  sys.exit("Error: Systemctl preset_all issue in %s" % ser=
vice)
>
> @@ -320,6 +321,7 @@ def main():
>      parser.add_argument('--preset-mode',
>                          choices=3D['full', 'enable-only', 'disable-only'=
],
>                          default=3D'full')
> +    parser.add_argument('--global', dest=3D"glob", action=3D"store_true"=
, default=3DFalse)
>

I guess `glob` because `global` is a keyword? But yuck... makes me
think of https://docs.python.org/3/library/glob.html


>      args =3D parser.parse_args()
>
> @@ -336,16 +338,18 @@ def main():
>          parser.print_help()
>          return 0
>
> +    unit_type =3D "user" if args.glob else "system"
> +
>      if command =3D=3D "mask":
>          for service in args.service:
>              try:
> -                SystemdUnit(root, service).mask()
> +                SystemdUnit(root, service, unit_type).mask()
>              except SystemdUnitNotFoundError as e:
>                  sys.exit("Error: Systemctl main mask issue in %s (%s)" %=
 (service, e.unit))
>      elif command =3D=3D "enable":
>          for service in args.service:
>              try:
> -                SystemdUnit(root, service).enable()
> +                SystemdUnit(root, service, unit_type).enable()
>              except SystemdUnitNotFoundError as e:
>                  sys.exit("Error: Systemctl main enable issue in %s (%s)"=
 % (service, e.unit))
>      elif command =3D=3D "preset-all":
> @@ -353,7 +357,7 @@ def main():
>              sys.exit("Too many arguments.")
>          if args.preset_mode !=3D "enable-only":
>              sys.exit("Only enable-only is supported as preset-mode.")
> -        preset_all(root)
> +        preset_all(root, unit_type)
>      else:
>          raise RuntimeError()
>
> --
> 2.47.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209686): https://lists.openembedded.org/g/openembedde=
d-core/message/209686
> Mute This Topic: https://lists.openembedded.org/mt/110569454/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alex Kiernan

