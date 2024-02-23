Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73921C5478C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 21:20:48 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.6466.1708723238996719035
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 13:20:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E4ig22lc;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51197ca63f5so1994768e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 13:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708723237; x=1709328037; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=usWK/ta2Vj36XeNjgqSm1Pa6ONf8Foq8aKU9qut5QPM=;
        b=E4ig22lcwXSYpOUO06aw5mwmXiSs/6RM1dbokoydzCNMs+xS7O/j3dTxuYJ7hNFpK3
         p9wC0B64yLxTzscaG5OupTzY95TFcgGTK0iAzcWASXB6nGmRms25TAhBnD9aXxnn7pwe
         99hZbFdVKPSTeVStHtsLpIB3JHakwmtR7eXEGO/+GWFV1nt9QhNd1D5ouU64pE1Nhxbh
         bQFS1iMtwNhMHQVKV5DIlTnJtjdY+ygwiEt5zzXLT/STU9AqFkXk+eIDa+fI/g3vDsvl
         3oCyzV97S9cAuIGCWqXI67wW28D3SJvwP+yFntDtXvWOx0/17wiVw9L2dtagpwICdwM1
         7jRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708723237; x=1709328037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=usWK/ta2Vj36XeNjgqSm1Pa6ONf8Foq8aKU9qut5QPM=;
        b=vACvQafoeeL+I2DByVoIX6MdVVxeKqdTlRtBKdlpZGLKX9xQo7LHsxzR2FcApcymY2
         iP3M5VWjrtMdQFf+ujhssCrxaGpTB/Zu/4CAw+flpnQ6UIhtKGW773rYJUeh/ldvXZ31
         OR33rZRBNGBM730Zzp2iSVa6lMqXifanhpjIo/XgQQhA+YPK3EnuOB/b9fDKZdsT+zLv
         oqAMJurRredC3N17171JA7kX6ub4mAeZVv0YatCsKFDoSEyOK+Z7JRqorHYC5oUAGBCb
         YLWgQMyHUce5t8gpCLBHxWgdaCwBFv/JZtzFDdhw55He7ZBefDowSG9HBxD/RphTinXv
         hXSQ==
X-Gm-Message-State: AOJu0YzaxQ1S6h0f/b0AicmzZ03LcOu+Oi8ThcQyKe+tGBil2RYvIcaA
	ShRJ0aqQKCLwNzH3elWUOWX48N7kqwN2ZXQcLxGkfWeatbKeyTFK17AUhLIHELha+ICbvHckSFm
	BYylomIMnR/PkIMWtfEiqzx7Zou4=
X-Google-Smtp-Source: AGHT+IHG5CTMSuB3gOqU5hx8L340JSVHsiH5DfdMfRbYbAETdBUSfA8ApxbRFaUVcx3yJt7mi4SkjjdyZBWGcan7tZw=
X-Received: by 2002:ac2:4919:0:b0:511:87b7:6d88 with SMTP id
 n25-20020ac24919000000b0051187b76d88mr577908lfi.32.1708723236637; Fri, 23 Feb
 2024 13:20:36 -0800 (PST)
MIME-Version: 1.0
References: <20240223203051.1575654-1-jpuhlman@mvista.com>
In-Reply-To: <20240223203051.1575654-1-jpuhlman@mvista.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 23 Feb 2024 22:20:24 +0100
Message-ID: <CANNYZj8JykJuL+Q4hsM_xut_=7E45Bbt-W6NEQZRPP6R_HfSCQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package_rpm: Fix backtrace on missing directory.
To: jpuhlman@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 21:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196114

Somewhere in the overall function the paths aren't formed correctly,
but this patch is very much not a correct fix either, and should be
marked as such. If you can provide a minimal reproducer recipe, that
would help; I can't say what is wrong otherwise.

You might want to insert debugging statements to see where opt//opt
formation is happening.

Alex

On Fri, 23 Feb 2024 at 21:31, Jeremy Puhlman via
lists.openembedded.org <jpuhlman=mvista.com@lists.openembedded.org>
wrote:
>
> From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
>
> This seems to work around the following issue. The recipe in quesiton
> places all of its content in /opt, and we turn on license collection
> globally. Systemd is turned on so usrmerge is also on. I doubt this
> is the correct way to deal with this as it is not clear why it is
> looking for /usr//usr in the first place. Not sure if its just a
> wierd edge case or what.
>
> File:
> '/build/../layers/poky/meta/classes-global/package_rpm.bbclass',
> lineno: 527, function: write_specfile
>      0523:            spec_scriptlets_bottom.append('')
>      0524:
>      0525:        # Now process files
>      0526:        file_list = []
>  *** 0527:        walk_files(root, file_list, conffiles, dirfiles)
>      0528:        if not file_list and localdata.getVar('ALLOW_EMPTY',
> False) != "1":
>      0529:            bb.note("Not creating empty RPM package for %s" %
> splitname)
>      0530:        else:
>      0531:            spec_files_bottom.append('%%files -n %s' %
> splitname)
> File:
> '/build/../layers/poky/meta/classes-global/package_rpm.bbclass',
> lineno: 249, function: walk_files
>      0245:                    target.append(get_attr(dir) + '%dir "' +
> escape_chars(p) + '"')
>      0246:            else:
>      0247:                # packages own only empty directories or
> explict directory.
>      0248:                # This will prevent the overlapping of
> security permission.
>  *** 0249:                attr = get_attr(path)
>      0250:                if path and not files and not dirs:
>      0251:                    target.append(attr + '%dir "' +
> escape_chars(path) + '"')
>      0252:                elif path and path in dirfiles:
>      0253:                    target.append(attr + '%dir "' +
> escape_chars(path) + '"')
> File:
> '/build/../layers/poky/meta/classes-global/package_rpm.bbclass',
> lineno: 203, function: get_attr
>      0199:        # of the walk, the isdir() test would then fail and
> the walk code would assume its a file
>      0200:        # hence we check for the names in files too.
>      0201:        for rootpath, dirs, files in os.walk(walkpath):
>      0202:            def get_attr(path):
>  *** 0203:                stat_f = os.stat(rootpath + "/" + path,
> follow_symlinks=False)
>      0204:                mode = stat.S_IMODE(stat_f.st_mode)
>      0205:                try:
>      0206:                    owner =
> pwd.getpwuid(stat_f.st_uid).pw_name
>      0207:                except Exception as e:
> Exception: FileNotFoundError: [Errno 2] No such file or directory:
> '/build/tmp/work/corei7-64-montavista-linux/mvtest/2.0/packages-split/mvtest-lic/opt//opt'
>
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>  meta/classes-global/package_rpm.bbclass | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
> index 2e3e4e8c79..a6885ac74e 100644
> --- a/meta/classes-global/package_rpm.bbclass
> +++ b/meta/classes-global/package_rpm.bbclass
> @@ -200,6 +200,8 @@ python write_specfile () {
>          # hence we check for the names in files too.
>          for rootpath, dirs, files in os.walk(walkpath):
>              def get_attr(path):
> +                if not os.path.exists(rootpath + "/" + path):
> +                   return ""
>                  stat_f = os.stat(rootpath + "/" + path, follow_symlinks=False)
>                  mode = stat.S_IMODE(stat_f.st_mode)
>                  try:
> @@ -243,7 +245,7 @@ python write_specfile () {
>                      p = path + '/' + dir
>                      # All packages own the directories their files are in...
>                      target.append(get_attr(dir) + '%dir "' + escape_chars(p) + '"')
> -            elif path:
> +            elif path and os.path.exists(path):
>                  # packages own only empty directories or explict directory.
>                  # This will prevent the overlapping of security permission.
>                  attr = get_attr(path)
> @@ -257,7 +259,7 @@ python write_specfile () {
>                  p = path + '/' + file
>                  if conffiles.count(p):
>                      target.append(attr + '%config "' + escape_chars(p) + '"')
> -                else:
> +                elif attr:
>                      target.append(attr + '"' + escape_chars(p) + '"')
>
>      # Prevent the prerm/postrm scripts from being run during an upgrade
> --
> 2.31.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196109): https://lists.openembedded.org/g/openembedded-core/message/196109
> Mute This Topic: https://lists.openembedded.org/mt/104536226/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

