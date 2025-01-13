Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A688E7719E
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 10:55:26 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.14520.1736765719524996118
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 02:55:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k+9e3Dz/;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d8a3e99e32so35533526d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 02:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736765718; x=1737370518; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jFacYWRONH/atImm7/SXRIHJQ0r8BCNcwyqWs4XZMgo=;
        b=k+9e3Dz/WOPReRkWFlxOJd9G9RMVY812SWvKt2VNzpbfJIMgWDV3GMtxIKqpHj5ikP
         i0pr6ybrRhbvhgKaSj+5lBWLZv/uMpbrMiz9bX+tD4euM76H/KkYstokMBUN4cN/cSIF
         Bbw8AHsFHqn6O9BY+55+8eEsMyfuY152lwbpkUT/a9nHxj5Pu9lHxfKqiZdPHWPdIo7w
         Hq/bB3fqSxfFktRjYzdod10nh8bSKzSSUAdswkmhy/AnzfcVdzuikS73YyYqEUxbjzph
         hwn14w4b7qd7mey7S787BM+MS05w7wggYOpOwimq2seSZJOuSPn7K9+mGpHhhKiJo3E0
         2pKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736765718; x=1737370518;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jFacYWRONH/atImm7/SXRIHJQ0r8BCNcwyqWs4XZMgo=;
        b=Njhcy5mZDQ9vAdVH6yDSdO9b1Plu8BAmPE1BECZ+sgyX7xfg9LoA1S5q5JXmMcw6XN
         U8B+cnpMhUvrbmkdkKPpvxTkf7a1R2Pcl/7j9elGaMWePgWpyml4JVH17THPKHhVLjUk
         HtvSUce5ki5aiUVVLKgr6mJuUo2m4KhVeSpBeIXVGXyeRcxsCAra0irh7MrMKQ15IHIE
         Qg/2922ns7W+7g1tYNjK5uuM0r2wU/rlZtucfNJeVP122sqU6epNxb6ZSDsay2I+2uQS
         CdbqLDxHuFAmUAmesWs7kHZar2F9j0K/m/uASIfPvaj7N4XJDDgb6IHMfYeg8zxENQdT
         9CxQ==
X-Gm-Message-State: AOJu0YzxlVFxeNRQWXx6lO8ZXd18+ESDkrCvm+4kgA6qcLir2fkyqhTF
	Ak9hcva4x36WaG+4Hddsd6K6aIC1kuweeKXFTzuJVezj1BbliniLDsqdOOrzpy0kQlk0aa7uHoe
	DdTShAUCElRHQIUd4+s/lY1Vl1ms=
X-Gm-Gg: ASbGnctyuRI/R8Lm5pJXImoguq35qvn6MEFVFzPJXiPNwNdhQ/xjVkYoeZVMeS0Mr1u
	m1x0hE6wIXd3UDuV1XdzwBDjt5nzim43aNns7IHNNuzMYgWyd/egRCbSe3LMKJ9W2eTDLERPb
X-Google-Smtp-Source: AGHT+IHzvprqvgU4wdxWcOVEtQl/aumuvNGyNsy8pTVqjpSrMPbzpuuyrb8LPm9wzz3y8VcIJGyGLyfxnTUziH9D48I=
X-Received: by 2002:a05:6214:d64:b0:6d8:9660:8877 with SMTP id
 6a1803df08f44-6df9b1dfb0fmr336043106d6.18.1736765718531; Mon, 13 Jan 2025
 02:55:18 -0800 (PST)
MIME-Version: 1.0
References: <20250112143141.1300189-1-arturkow2000@gmail.com> <20250112143141.1300189-3-arturkow2000@gmail.com>
In-Reply-To: <20250112143141.1300189-3-arturkow2000@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Jan 2025 11:55:07 +0100
X-Gm-Features: AbW1kvaRIlIfasxxXYJHfjjIbcp6pdEEOcqSoLwxW9mCGnmHcP7bnPUPXF0aUXs
Message-ID: <CANNYZj_W8CSStncA2=AFzEfq-nfBy8GhL1p7AKW9ZO6c2N9bvg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] systemd.bbclass: add support for user presets
To: arturkow2000@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 10:55:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209706

Can this patch be split up to make review easier? Particularly,
separate adding new functions into their own commits, with
justification for each, and introduce usage of those functions in
separate commits as well if possible, again with justification for
each.

Alex

On Sun, 12 Jan 2025 at 15:40, Artur Kowalski via
lists.openembedded.org <arturkow2000=gmail.com@lists.openembedded.org>
wrote:
>
> Previously user units were causing build erros when listed in
> SYSTEMD_SERVICE and SYSTEMD_AUTO_ENABLE was set.
>
> Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
> ---
>  meta/classes-recipe/systemd.bbclass | 120 +++++++++++++++++++++-------
>  1 file changed, 93 insertions(+), 27 deletions(-)
>
> diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
> index 4b4470b7b3..80f4da3bdf 100644
> --- a/meta/classes-recipe/systemd.bbclass
> +++ b/meta/classes-recipe/systemd.bbclass
> @@ -37,17 +37,29 @@ if systemctl >/dev/null 2>/dev/null; then
>         fi
>
>         if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
> -               for service in ${SYSTEMD_SERVICE_ESCAPED}; do
> +               for service in ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}; do
>                         systemctl ${OPTS} enable "$service"
>                 done
> +
> +               for service in ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}; do
> +                       systemctl --global ${OPTS} enable "$service"
> +               done
>         fi
>
>         if [ -z "$D" ]; then
> +               # Reload only system service manager
> +               # --global for daemon-reload is not supported: https://github.com/systemd/systemd/issues/19284
>                 systemctl daemon-reload
> -               systemctl preset ${SYSTEMD_SERVICE_ESCAPED}
> +               [ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}" ] && \
> +                       systemctl preset ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}
> +
> +               [ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}" ] && \
> +                       systemctl --global preset ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}
>
>                 if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
> -                       systemctl --no-block restart ${SYSTEMD_SERVICE_ESCAPED}
> +                       # --global flag for restart is not supported by systemd (see above)
> +                       [ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}" ] && \
> +                               systemctl --no-block restart ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}
>                 fi
>         fi
>  fi
> @@ -56,9 +68,14 @@ fi
>  systemd_prerm() {
>  if systemctl >/dev/null 2>/dev/null; then
>         if [ -z "$D" ]; then
> -               systemctl stop ${SYSTEMD_SERVICE_ESCAPED}
> +               # same as above, --global flag is not supported for stop
> +               if [ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}" ]; then
> +                       systemctl stop ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}
> +                       systemctl disable ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}
> +               fi
>
> -               systemctl disable ${SYSTEMD_SERVICE_ESCAPED}
> +               [ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}" ] && \
> +                       systemctl --global disable ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}
>         fi
>  fi
>  }
> @@ -67,6 +84,44 @@ fi
>  systemd_populate_packages[vardeps] += "systemd_prerm systemd_postinst"
>  systemd_populate_packages[vardepsexclude] += "OVERRIDES"
>
> +def systemd_service_path(service, searchpaths, d):
> +    path_found = ''
> +
> +    # Deal with adding, for example, 'ifplugd@eth0.service' from
> +    # 'ifplugd@.service'
> +    base = None
> +    at = service.find('@')
> +    if at != -1:
> +        ext = service.rfind('.')
> +        base = service[:at] + '@' + service[ext:]
> +
> +    for path in searchpaths:
> +        if os.path.lexists(oe.path.join(d.getVar("D"), path, service)):
> +            path_found = path
> +            break
> +        elif base is not None:
> +            if os.path.exists(oe.path.join(d.getVar("D"), path, base)):
> +                path_found = path
> +                break
> +
> +    return path_found, base
> +
> +def systemd_service_exists(service, user, d):
> +    searchpaths = [
> +        oe.path.join(d.getVar("sysconfdir"), "systemd", "user"),
> +        d.getVar("systemd_user_unitdir"),
> +    ] if user else [
> +        oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),
> +        d.getVar("systemd_system_unitdir"),
> +    ]
> +
> +    path, _ = systemd_service_path(service, searchpaths, d)
> +
> +    return path != ''
> +
> +def systemd_filter_services(services, user, d):
> +    return ' '.join(service for service in services.split() if systemd_service_exists(service, user, d))
> +
>
>  python systemd_populate_packages() {
>      import re
> @@ -147,7 +202,10 @@ python systemd_populate_packages() {
>
>      # Check service-files and call systemd_add_files_and_parse for each entry
>      def systemd_check_services():
> -        searchpaths = [oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),]
> +        searchpaths = [
> +            oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),
> +            oe.path.join(d.getVar("sysconfdir"), "systemd", "user"),
> +        ]
>          searchpaths.append(d.getVar("systemd_system_unitdir"))
>          searchpaths.append(d.getVar("systemd_user_unitdir"))
>          systemd_packages = d.getVar('SYSTEMD_PACKAGES')
> @@ -155,24 +213,7 @@ python systemd_populate_packages() {
>          # scan for all in SYSTEMD_SERVICE[]
>          for pkg_systemd in systemd_packages.split():
>              for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd).split():
> -                path_found = ''
> -
> -                # Deal with adding, for example, 'ifplugd@eth0.service' from
> -                # 'ifplugd@.service'
> -                base = None
> -                at = service.find('@')
> -                if at != -1:
> -                    ext = service.rfind('.')
> -                    base = service[:at] + '@' + service[ext:]
> -
> -                for path in searchpaths:
> -                    if os.path.lexists(oe.path.join(d.getVar("D"), path, service)):
> -                        path_found = path
> -                        break
> -                    elif base is not None:
> -                        if os.path.exists(oe.path.join(d.getVar("D"), path, base)):
> -                            path_found = path
> -                            break
> +                path_found, base = systemd_service_path(service, searchpaths, d)
>
>                  if path_found != '':
>                      systemd_add_files_and_parse(pkg_systemd, path_found, service)
> @@ -180,13 +221,38 @@ python systemd_populate_packages() {
>                      bb.fatal("Didn't find service unit '{0}', specified in SYSTEMD_SERVICE:{1}. {2}".format(
>                          service, pkg_systemd, "Also looked for service unit '{0}'.".format(base) if base is not None else ""))
>
> -    def systemd_create_presets(pkg, action):
> -        presetf = oe.path.join(d.getVar("PKGD"), d.getVar("systemd_unitdir"), "system-preset/98-%s.preset" % pkg)
> +    def _systemd_create_presets(pkg, action, prefix, searchpaths):
> +        # Check there is at least one service of given type (system/user), don't
> +        # create empty files.
> +        needs_preset = False
> +        for service in d.getVar('SYSTEMD_SERVICE:%s' % pkg).split():
> +            path_found, _ = systemd_service_path(service, searchpaths, d)
> +            if path_found != '':
> +                needs_preset = True
> +                break
> +
> +        if not needs_preset:
> +            return
> +
> +        presetf = oe.path.join(d.getVar("PKGD"), d.getVar("systemd_unitdir"), "%s-preset/98-%s.preset" % (prefix, pkg))
>          bb.utils.mkdirhier(os.path.dirname(presetf))
>          with open(presetf, 'a') as fd:
>              for service in d.getVar('SYSTEMD_SERVICE:%s' % pkg).split():
> +                path_found, _ = systemd_service_path(service, searchpaths, d)
> +                if path_found == '':
> +                    continue
>                  fd.write("%s %s\n" % (action,service))
> -        d.appendVar("FILES:%s" % pkg, ' ' + oe.path.join(d.getVar("systemd_unitdir"), "system-preset/98-%s.preset" % pkg))
> +        d.appendVar("FILES:%s" % pkg, ' ' + oe.path.join(d.getVar("systemd_unitdir"), "%s-preset/98-%s.preset" % (prefix, pkg)))
> +
> +    def systemd_create_presets(pkg, action):
> +        _systemd_create_presets(pkg, action, "system", [
> +            oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),
> +            d.getVar("systemd_system_unitdir"),
> +        ])
> +        _systemd_create_presets(pkg, action, "user", [
> +            oe.path.join(d.getVar("sysconfdir"), "systemd", "user"),
> +            d.getVar("systemd_user_unitdir"),
> +        ])
>
>      # Run all modifications once when creating package
>      if os.path.exists(d.getVar("D")):
> --
> 2.47.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209687): https://lists.openembedded.org/g/openembedded-core/message/209687
> Mute This Topic: https://lists.openembedded.org/mt/110569455/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

