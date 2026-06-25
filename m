Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3B5CDE001
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 15:19:06 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14130.1782400738715594264
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 08:18:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KE85egh2;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7fe8bc0a01bso210457b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 08:18:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782400738; cv=none;
        d=google.com; s=arc-20260327;
        b=VGq/80KHH9vZzBzxMP4RdpZS0QMWc2T8JAicMYhEx0aHfUWlO8EIGOzFkUrpJ/b7gP
         942hyGQkuT5xHxTgVmdt2c1QHQZXQxaS1clI3ikWE2WufM+4eX94Hjcm82m3RdGQ2gJy
         Shs51YsmOfpIrFbMxhdRYGGj6l7XKdaZJPgDwOMOCo0IW5bM2U6DMhrsAhO+mSCIq/C0
         Q9Lu+3hPMcVy15IO3T15i9Su3YJwkBTNtS49/GF+lnyAPfjXRIpxYCAKbkJKXxd4d62A
         q3D3I3R2KjKKj8k5aF/p7OS/17XoAv5QAJy/0MkcTADhMBBIPXQzZ9PHfmWtdLh3OJ79
         UwZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nA2qzvwrFevDx8GF1FUbTWQKLqKq/xx16J2x6qRaCBI=;
        fh=ZalfJJupMFrxQVhj5GRLYKJMovrtmUeW+W5saYyPgHU=;
        b=UM1MqyV8ewOGmA7fNr8VEpDH+6jW7zS4pbrTjLXmZ42yZGD26a6C3OOZ6ws6XFcaBX
         EA+NHHvQUkkcPbtwQx67gHgDGSUausuZIkRB2N0CcTaCM7wpH89wJQFuwphdTXgypmvf
         uwflhQSW/JFy8Wt/RW6jls1do3CmrZLbeq0W+IZRJXf1o4AidAU2qgMhnSxZlTC6Czi8
         pjgRYVhsq/v1+HmX6UFwyjys5uCGvqZNnwvojKIf9Nlw8QeUF7DUCGYkpEJmFLD/kApt
         nN585v6Jep+eH6cG82G6rtEpp7D2eKd6BNLbXBntX89S4sG1FCDd6WPtRnPdCJfx8kTp
         tABA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782400738; x=1783005538; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nA2qzvwrFevDx8GF1FUbTWQKLqKq/xx16J2x6qRaCBI=;
        b=KE85egh2akyrfJsLcHkC9zj7AYj5Mp0sVV8Yxmpz6CpL/F0ODtETf//ci2MHzQeAHQ
         9epNzJFmS0sD8lkG0Nl/PHu90bC/xzZTZhrpBcYeZhfB/TjoeZIGvPJD5MEW4DCR2990
         6IK1pn54EaKoc/3jeaU1Iy5qAKkZX/saFBKrw7GOzMqWYG+YtKyCQHVN6v2AReYUT6lK
         mxQBZsmL/+tC/M3xSMeoq4F+AKu/UMY35Jzviv2kBoeRGRk3PGTpROHTONkUsdLBewLW
         iy2tpKqxdA7Xs3SZduT+w1hWqcKGXdwghAh4R5lnP5+v8Q9XfKBZTjuBcNQY7ApQqsOX
         eY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782400738; x=1783005538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nA2qzvwrFevDx8GF1FUbTWQKLqKq/xx16J2x6qRaCBI=;
        b=SUitWfb09Ou+iNkT3eZKvaV5kd+lCYTOIKy4/ajf9DIuVDGMWT3hjdGt2E2joWe14h
         YSUCNXTlmfFLyhKZNp1xirikjlr2DD4MWv7s7dn+3LZoVmW/9HHF9LmjIjO7g+oRa7w8
         6MEh1G92iaA4QVHmebROJWnQ6vjp5WSTibVNL31KJdeX+lQvEDz85gHHRLLNgUfJLRZT
         XYF6g2Hw7ZI2XGl1AziQRceg2H+srYBrYJrK+0apbKugK8gtK6/zw2CRvoXJqOyJLYYA
         kTeX9AXlcJWFfThKVTnMBMiBvSUobKe333ivQ9NisZ1CQTJE8uFtm7JWSWPlKmwwfG6v
         gC/Q==
X-Gm-Message-State: AOJu0YxLAiN69MW/8lb2YYAaMPi24IfnXScUc0cvlYwaHsk96TErqZir
	WWGsMYeTHf8O/0diJMEVh/F96uoiP8sRbU0dJb49Uz3NR8hV0AsydsTCu61EwnSf3qEdWK4ItyF
	rsdpiStAXk5Q51PV1i9APejYw69oSADI=
X-Gm-Gg: AfdE7ck8s6PPwiNoCmJzLMUSUmEarQmCBGspwkOQhDmftWubYa6wlDWUDsojOfNGukD
	da7r2a21tqisNE2WK3Ww+ogVtbs82FbC+pdujS7yE7mm0sT4cH35Fh2LP2Zw4zwJlGDKApbRwd+
	J4+T183e2wwDp/z7E9zLbs20bbXYpclEy42jCqCBzfM/ZENtZ9XR057EnQCZDP6wXwm9xz7hDiq
	UR4BwSqEqpnPEJoPqRWDHmTMfdtMYmHnW9azGF9mylCvxR06xNOQLVKwti63hy1Pufbz3q9Qg==
X-Received: by 2002:a05:690c:620f:b0:809:eba7:9f05 with SMTP id
 00721157ae682-80a680feb09mr28439187b3.20.1782400737586; Thu, 25 Jun 2026
 08:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260625092726.35752-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20260625092726.35752-1-jaipaul.cheernam@est.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 25 Jun 2026 17:18:45 +0200
X-Gm-Features: AVVi8CcZxRqRNj2Pcrxh0-2-Xomivb7bS4tNbT_drw9S7wKsKNrQ-8Zny4B5zi8
Message-ID: <CANNYZj83+askoFdd86w36=gHG-a2xc2eE_vXNt8Cw6+8-yKksw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] install-buildtools: add --local-file option
To: jaipaul.cheernam@est.tech
Cc: openembedded-core@lists.openembedded.org, 
	Daniel Turull <daniel.turull@ericsson.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 15:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239576

This is really hard to review. You need to split this up: first move
the existing code into its own function (or functoins) in a separate
commit, then add the new logic in a second commit.

Alex

On Thu, 25 Jun 2026 at 11:27, Jaipaul Cheernam via
lists.openembedded.org
<jaipaul.cheernam=est.tech@lists.openembedded.org> wrote:
>
> When buildtools are fetched externally (e.g. by bitbake-setup using
> bb.fetch with checksum verification), install-buildtools does not need
> to download or verify the file again.
>
> Add --local-file to accept a path to a pre-downloaded installer,
> skipping the download and checksum steps. The existing standalone
> download behaviour is preserved in the else branch.
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  scripts/install-buildtools | 109 +++++++++++++++++++++----------------
>  1 file changed, 62 insertions(+), 47 deletions(-)
>
> diff --git a/scripts/install-buildtools b/scripts/install-buildtools
> index 723edd793e..943770c84c 100755
> --- a/scripts/install-buildtools
> +++ b/scripts/install-buildtools
> @@ -130,6 +130,10 @@ def main():
>          description="Buildtools installation helper",
>          add_help=False,
>          formatter_class=argparse.RawTextHelpFormatter)
> +    parser.add_argument('--local-file',
> +                        help='path to a pre-downloaded buildtools installer file.\n'
> +                             'Cannot be combined with --url or --filename.',
> +                        action='store')
>      parser.add_argument('-u', '--url',
>                          help='URL from where to fetch buildtools SDK installer, not '
>                               'including filename (optional)\n'
> @@ -243,62 +247,73 @@ def main():
>      os.makedirs(sdk_dir, exist_ok=True)
>      try:
>          # Fetch installer
> -        logger.info("Fetching buildtools installer")
> -        tmpbuildtools = os.path.join(sdk_dir, filename)
> -        with open(os.path.join(sdk_dir, 'buildtools_url'), 'w') as f:
> -            f.write(buildtools_url)
> -        ret = subprocess.call("wget -q -O %s %s" %
> -                              (tmpbuildtools, buildtools_url), shell=True)
> -        if ret != 0:
> -            logger.error("Could not download file from %s" % buildtools_url)
> -            return ret
> -
> -        # Verify checksum
> -        if args.check:
> -            logger.info("Fetching buildtools installer checksum")
> -            checksum_type = "sha256sum"
> -            checksum_url = "{}.{}".format(buildtools_url, checksum_type)
> -            checksum_filename = "{}.{}".format(filename, checksum_type)
> -            tmpbuildtools_checksum = os.path.join(sdk_dir, checksum_filename)
> -            with open(os.path.join(sdk_dir, 'checksum_url'), 'w') as f:
> -                f.write(checksum_url)
> -            ret = subprocess.call("wget -q -O %s %s" %
> -                                    (tmpbuildtools_checksum, checksum_url), shell=True)
> +        if args.local_file:
> +            if args.url or args.filename:
> +                parser.error("--local-file cannot be combined with --url or --filename")
> +            tmpbuildtools = os.path.abspath(args.local_file)
> +            if not os.path.exists(tmpbuildtools):
> +                logger.error("Local file not found: %s" % tmpbuildtools)
> +                return 1
> +            filename = os.path.basename(tmpbuildtools)
> +        else:
> +            logger.info("Fetching buildtools installer")
> +            tmpbuildtools = os.path.join(sdk_dir, filename)
> +            with open(os.path.join(sdk_dir, 'buildtools_url'), 'w') as f:
> +                f.write(buildtools_url)
> +            ret = subprocess.call(["wget", "-q", "-O", tmpbuildtools, buildtools_url])
>              if ret != 0:
> -                logger.error("Could not download file from %s" % checksum_url)
> +                logger.error("Could not download file from %s" % buildtools_url)
>                  return ret
> -            regex = re.compile(r"^(?P<checksum>[0-9a-f]+)\s+(?P<path>.*/)?(?P<filename>.*)$")
> -            with open(tmpbuildtools_checksum, 'rb') as f:
> -                original = f.read()
> -                m = re.search(regex, original.decode("utf-8"))
> -                logger.debug("checksum regex match: %s" % m)
> -                logger.debug("checksum: %s" % m.group('checksum'))
> -                logger.debug("path: %s" % m.group('path'))
> -                logger.debug("filename: %s" % m.group('filename'))
> -                if filename != m.group('filename'):
> -                    logger.error("Filename does not match name in checksum")
> +
> +            # Verify checksum
> +            if args.check:
> +                logger.info("Fetching buildtools installer checksum")
> +                checksum_type = "sha256sum"
> +                checksum_url = "{}.{}".format(buildtools_url, checksum_type)
> +                checksum_filename = "{}.{}".format(filename, checksum_type)
> +                tmpbuildtools_checksum = os.path.join(sdk_dir, checksum_filename)
> +                with open(os.path.join(sdk_dir, 'checksum_url'), 'w') as f:
> +                    f.write(checksum_url)
> +                ret = subprocess.call(["wget", "-q", "-O", tmpbuildtools_checksum, checksum_url])
> +                if ret != 0:
> +                    logger.error("Could not download file from %s" % checksum_url)
> +                    return ret
> +                regex = re.compile(r"^(?P<checksum>[0-9a-f]+)\s+(?P<path>.*/)?(?P<filename>.*)$")
> +                with open(tmpbuildtools_checksum, 'rb') as f:
> +                    original = f.read()
> +                    m = re.search(regex, original.decode("utf-8"))
> +                    logger.debug("checksum regex match: %s" % m)
> +                    logger.debug("checksum: %s" % m.group('checksum'))
> +                    logger.debug("path: %s" % m.group('path'))
> +                    logger.debug("filename: %s" % m.group('filename'))
> +                    if filename != m.group('filename'):
> +                        logger.error("Filename does not match name in checksum")
> +                        return 1
> +                    checksum = m.group('checksum')
> +                checksum_value = sha256_file(tmpbuildtools)
> +                if checksum == checksum_value:
> +                        logger.info("Checksum success")
> +                else:
> +                    logger.error("Checksum %s expected. Actual checksum is %s." %
> +                                 (checksum, checksum_value))
>                      return 1
> -                checksum = m.group('checksum')
> -            checksum_value = sha256_file(tmpbuildtools)
> -            if checksum == checksum_value:
> -                    logger.info("Checksum success")
> -            else:
> -                logger.error("Checksum %s expected. Actual checksum is %s." %
> -                             (checksum, checksum_value))
> -                return 1
>
>          # Make installer executable
> -        logger.info("Making installer executable")
> -        st = os.stat(tmpbuildtools)
> -        os.chmod(tmpbuildtools, st.st_mode | stat.S_IEXEC)
> -        logger.debug(os.stat(tmpbuildtools))
> +        if args.local_file:
> +            # Avoid mutating caller-owned file; invoke via /bin/sh instead
> +            cmd = ["/bin/sh", tmpbuildtools]
> +        else:
> +            logger.info("Making installer executable")
> +            st = os.stat(tmpbuildtools)
> +            os.chmod(tmpbuildtools, st.st_mode | stat.S_IEXEC)
> +            logger.debug(os.stat(tmpbuildtools))
> +            cmd = [tmpbuildtools]
>          if args.directory:
>              install_dir = os.path.abspath(args.directory)
> -            ret = subprocess.call("%s -d %s -y" %
> -                                  (tmpbuildtools, install_dir), shell=True)
> +            ret = subprocess.call(cmd + ["-d", install_dir, "-y"])
>          else:
>              install_dir = "/opt/poky/%s" % args.installer_version
> -            ret = subprocess.call("%s -y" % tmpbuildtools, shell=True)
> +            ret = subprocess.call(cmd + ["-y"])
>          if ret != 0:
>              logger.error("Could not run buildtools installer")
>              return ret
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239551): https://lists.openembedded.org/g/openembedded-core/message/239551
> Mute This Topic: https://lists.openembedded.org/mt/119970828/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

