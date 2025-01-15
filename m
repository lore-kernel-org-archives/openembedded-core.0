Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80AEC02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 14:04:33 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.21560.1736949865320532809
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 06:04:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Od/76wmj;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30616d71bb0so37899651fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 06:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736949863; x=1737554663; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCs2y5xpGGEQaDeBL4S30aPn+56pc6262qzH5y6S3aM=;
        b=Od/76wmjyGF2UZjkckRtFg9PhabHbilzxo7G3s42QKZ8zMUzSPY9BnpZerOVkCZyfI
         7lviyE+VLxDQx3tvI1kjMGswbVqKRe5wQGITd124mn46FZ1w6XFlUDJx2c/AggSzsS6w
         mqB7Wo6O128voW6f6YC1CubKRUJHhOZr49p7NEChP8YyDY5KBDBuxh4FE6nGK0hDl1GJ
         eYqP5iJhN2QVMq6yphZMka1Ckz+4r0iDA15shPJ95Eqzam29rGggn7xPAvLF6/QeOLfp
         OM5x9Cktho1H6bUGxcKfRfChZSjtS5h+u128UMKVdslcN/LE8fOgkjD5mdeIcRuK/sn9
         mDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736949863; x=1737554663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCs2y5xpGGEQaDeBL4S30aPn+56pc6262qzH5y6S3aM=;
        b=upFftRh8yUbedcCutVPfVWdRJqYIed+RgH7Rcq68DnjSNs7e1AMgHRt3fMZjFyLwyI
         SN6nRpkva/EneP7md6QXJCBgD78pvwkqHnrhN6pX0YZNdXnKpO3i2QOT6Paivrh4pgr8
         vSGOmLNMO1yhAR5OwcAk+Bdp1Ge/qFF/JE/aCyNjJjvd3e5FaVP3FHHPOT8uN/BK5xdH
         cdPZlpRnxzsr4ArWNsXWYtSoItweAdN8Udeb82JTmRNa0MTeW7ymrzzg+S01UEak1c/G
         z6lOHS8thJ1anUdlMZav4gA2aer05Y5q5Ih/kmJ/RBa4eIzU20BJqN3q0MeS1PzKLNGL
         ZcxQ==
X-Gm-Message-State: AOJu0YybR6GLttCBuqPDFiqdK2OCgFIr21QFxRUT9kK+eTwdxCRlorqq
	rLTQP8YS1U3EcoW9jEF/vhhzudr6sFVptXypqNjIR6KUyhAN8uIuUu2n4BgSRqYMZHyRJFqcTPW
	hR8ieaEh5kAYv0MPoTyKMJIN6xb4=
X-Gm-Gg: ASbGnctwggPa5ePk5ULVTE9rX3YZwC7cQrITXij12DSabsoB/S+5wnxWs0xS9tA34gp
	EJopjXuW74A024+/oEW27BEDu3VRR/QPK/5S1giQvoe3zfG7XYz8Omiq1P+mkIsSM9WI=
X-Google-Smtp-Source: AGHT+IFRGHv5gbMZ/uH04kGrBz/2PeMa1OZwokJSkq1WuBqCKGYfpj9nfKMCJvCy+oT+bHilHQ2nEl14kRGawI7ElgA=
X-Received: by 2002:a2e:b887:0:b0:302:22e6:5f8 with SMTP id
 38308e7fff4ca-305f45b11b7mr103385371fa.22.1736949862835; Wed, 15 Jan 2025
 06:04:22 -0800 (PST)
MIME-Version: 1.0
References: <20250112143141.1300189-1-arturkow2000@gmail.com>
 <20250112143141.1300189-2-arturkow2000@gmail.com> <CAO5Uq5SJ8M3SBWB0WrkZZ8rE46J1XEMp45Ubtk-k4v5LgNALcg@mail.gmail.com>
 <73914221-eb80-433e-a37a-37cf046014d5@gmail.com>
In-Reply-To: <73914221-eb80-433e-a37a-37cf046014d5@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 15 Jan 2025 14:04:10 +0000
X-Gm-Features: AbW1kvasLz2K3z2U6VGSvhYBLxl5moqgCPrpbMmPuZHv0xXhm9puNtIEAZ7t3IM
Message-ID: <CAO5Uq5SPwjq8hngo9BsSTht4pjQvf5AQ5n0zXUTyDLj25htMcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] systemd-systemctl: add support for --global flag
To: Artur Kowalski <arturkow2000@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 14:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209902

On Mon, Jan 13, 2025 at 9:18=E2=80=AFPM Artur Kowalski <arturkow2000@gmail.=
com> wrote:
>
>
> W dniu 12.01.2025 o 16:34, Alex Kiernan pisze:
> > On Sun, Jan 12, 2025 at 2:40=E2=80=AFPM Artur Kowalski via
> > lists.openembedded.org <arturkow2000=3Dgmail.com@lists.openembedded.org=
>
> > wrote:
> >> The flag is similar to --user flag as it causes systemctl to operate o=
n
> >> user units, but it performs operations globally for all users. This is
> >> required to for user presets support.
> > "to for"? Drop the "to"?
> >
> >> Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
> >> ---
> >>   .../systemd/systemd-systemctl/systemctl       | 42 ++++++++++-------=
--
> >>   1 file changed, 23 insertions(+), 19 deletions(-)
> >>
> >> diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/m=
eta/recipes-core/systemd/systemd-systemctl/systemctl
> >> index 2229bc7b6d..9b8fe81459 100755
> >> --- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
> >> +++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> >> @@ -29,15 +29,15 @@ class SystemdFile():
> >>
> >>       _clearable_keys =3D ['WantedBy']
> >>
> >> -    def __init__(self, root, path, instance_unit_name):
> >> +    def __init__(self, root, path, instance_unit_name, unit_type):
> >>           self.sections =3D dict()
> >>           self._parse(root, path)
> >>           dirname =3D os.path.basename(path.name) + ".d"
> >>           for location in locations:
> >> -            files =3D (root / location / "system" / dirname).glob("*.=
conf")
> >> +            files =3D (root / location / unit_type / dirname).glob("*=
.conf")
> >>               if instance_unit_name:
> >>                   inst_dirname =3D instance_unit_name + ".d"
> >> -                files =3D chain(files, (root / location / "system" / =
inst_dirname).glob("*.conf"))
> >> +                files =3D chain(files, (root / location / unit_type /=
 inst_dirname).glob("*.conf"))
> >>               for path2 in sorted(files):
> >>                   self._parse(root, path2)
> >>
> >> @@ -182,21 +182,22 @@ class SystemdUnitNotFoundError(Exception):
> >>
> >>
> >>   class SystemdUnit():
> >> -    def __init__(self, root, unit):
> >> +    def __init__(self, root, unit, unit_type):
> >>           self.root =3D root
> >>           self.unit =3D unit
> >> +        self.unit_type =3D unit_type
> >>           self.config =3D None
> >>
> >>       def _path_for_unit(self, unit):
> >>           for location in locations:
> >> -            path =3D self.root / location / "system" / unit
> >> +            path =3D self.root / location / self.unit_type / unit
> >>               if path.exists() or path.is_symlink():
> >>                   return path
> >>
> >>           raise SystemdUnitNotFoundError(self.root, unit)
> >>
> >>       def _process_deps(self, config, service, location, prop, dirstem=
, instance):
> >> -        systemdir =3D self.root / SYSCONFDIR / "systemd" / "system"
> >> +        systemdir =3D self.root / SYSCONFDIR / "systemd" / self.unit_=
type
> >>
> >>           target =3D ROOT / location.relative_to(self.root)
> >>           try:
> >> @@ -229,7 +230,7 @@ class SystemdUnit():
> >>               # ignore aliases
> >>               return
> >>
> >> -        config =3D SystemdFile(self.root, path, instance_unit_name)
> >> +        config =3D SystemdFile(self.root, path, instance_unit_name, s=
elf.unit_type)
> >>           if instance =3D=3D "":
> >>               try:
> >>                   default_instance =3D config.get('Install', 'DefaultI=
nstance')[0]
> >> @@ -250,14 +251,14 @@ class SystemdUnit():
> >>                   try:
> >>                        units_enabled.append(unit)
> >>                        if also not in units_enabled:
> >> -                        SystemdUnit(self.root, also).enable(units_ena=
bled)
> >> +                        SystemdUnit(self.root, also, self.unit_type).=
enable(units_enabled)
> >>                   except SystemdUnitNotFoundError as e:
> >>                       sys.exit("Error: Systemctl also enable issue wit=
h  %s (%s)" % (service, e.unit))
> >>
> >>           except KeyError:
> >>               pass
> >>
> >> -        systemdir =3D self.root / SYSCONFDIR / "systemd" / "system"
> >> +        systemdir =3D self.root / SYSCONFDIR / "systemd" / self.unit_=
type
> >>           target =3D ROOT / path.relative_to(self.root)
> >>           try:
> >>               for dest in config.get('Install', 'Alias'):
> >> @@ -268,15 +269,15 @@ class SystemdUnit():
> >>               pass
> >>
> >>       def mask(self):
> >> -        systemdir =3D self.root / SYSCONFDIR / "systemd" / "system"
> >> +        systemdir =3D self.root / SYSCONFDIR / "systemd" / self.unit_=
type
> >>           add_link(systemdir / self.unit, "/dev/null")
> >>
> >>
> >> -def collect_services(root):
> >> +def collect_services(root, unit_type):
> >>       """Collect list of service files"""
> >>       services =3D set()
> >>       for location in locations:
> >> -        paths =3D (root / location / "system").glob("*")
> >> +        paths =3D (root / location / unit_type).glob("*")
> >>           for path in paths:
> >>               if path.is_dir():
> >>                   continue
> >> @@ -285,16 +286,16 @@ def collect_services(root):
> >>       return services
> >>
> >>
> >> -def preset_all(root):
> >> -    presets =3D Presets('system-preset', root)
> >> -    services =3D collect_services(root)
> >> +def preset_all(root, unit_type):
> >> +    presets =3D Presets('{}-preset'.format(unit_type), root)
> >> +    services =3D collect_services(root, unit_type)
> >>
> >>       for service in services:
> >>           state =3D presets.state(service)
> >>
> >>           if state =3D=3D "enable" or state is None:
> >>               try:
> >> -                SystemdUnit(root, service).enable()
> >> +                SystemdUnit(root, service, unit_type).enable()
> >>               except SystemdUnitNotFoundError:
> >>                   sys.exit("Error: Systemctl preset_all issue in %s" %=
 service)
> >>
> >> @@ -320,6 +321,7 @@ def main():
> >>       parser.add_argument('--preset-mode',
> >>                           choices=3D['full', 'enable-only', 'disable-o=
nly'],
> >>                           default=3D'full')
> >> +    parser.add_argument('--global', dest=3D"glob", action=3D"store_tr=
ue", default=3DFalse)
> >>
> > I guess `glob` because `global` is a keyword? But yuck... makes me
> > think of https://docs.python.org/3/library/glob.html
>
> Yes, that's the reason. Would using `global_` be okay? I choose
> suffixing instead of prefixing as underscore prefix has special meaning
> for private fields in Python so I guess that also wouldn't be best fit.
>

How about `opt_global` - makes it obvious it's an option we're talking
about? I think the option name is pretty unclear, but clearly it's
part of the upstream systemctl ABI so is fixed.

--=20
Alex Kiernan

