Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E56CA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 08:52:37 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.72453.1756803149439081253
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 01:52:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dq8o+9Dm;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b34a3a6f64so3292801cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 01:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756803148; x=1757407948; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9lLQqnj2LoKvfo6Vwgo/PcX/QR3D2yezS4QjxkvVo6A=;
        b=Dq8o+9DmYvU0nKuGVQ3ik8f+crbaI8d9RhJ3dxMsh2uNjfPsmn7GKuMtrznzA5fQlT
         B3zImZxmqxZxo2rR50xgTRN0ZJh7VozMH6yzp2X7SwZl19ZVHdgFG92cnv02WweQAiNU
         9cFDtvQdOYWMbQ7Yu1aA7LMvUtY0BaevGEPGZ2GlhBPxRP+F9Es2Yoa2kbGUzS/komRX
         DyK7YGYmisF2BBUhpyySX5LrnHEGuo6fcOn3MDhvD3q25jr6IjSQJeHN/6wngy4KV045
         W9Q8e0sCcXMy9lBw54nbGCVfJ28ukF04hFFCtPYrQKf8x4cFk+F/A8TAM96o/BjKjltR
         EKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756803148; x=1757407948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9lLQqnj2LoKvfo6Vwgo/PcX/QR3D2yezS4QjxkvVo6A=;
        b=I+XDdVYoxZdldQBIQfiDQOmvrpYRx5kCw5gG/wcKK0b36/jjTQXOqNDLX514Y66i7E
         BbXNQvHgeyuE4IrVhlc9XEqkHGrEOa+SmcByixMmzXIg+/urEJ0Rt4i8hT849Y2fyLp2
         4XB87fXTZxj7UPn7/93qep/u2CQL3G6KNy4Pt/hKU6s0avD5NTYho9dw5Bn/7nTQ3Df1
         kYRpzgJE5dYReu6D144kuJUdX4O/w0gc0YNhkyCp/bDb7Sgn8s+QdDUKf83xFRMDF9/u
         9jA8uHUzE8K2AeynsvP2Uy9mFgUG1HjYQVriNc//s7QaIhAnzUnkDIBVtsfc4EccefN+
         z9DA==
X-Gm-Message-State: AOJu0Yxa8ctleCb5wWTAuf7/QtGx1EsQWt37ej7AUAWL2xzQ93TIizbh
	Hmm9ekdxsHMyiMUKJwMcOEs0ae0Ng4hBNCk+asdcvUhoWxZkjYRGDNr3SVNlwEwPIkJI+c8Db6i
	u5XundzAA53oUAvlA26OD/ye9WRvaqUc=
X-Gm-Gg: ASbGncvDDMsTOWYTyAVIjcfredbP0jJ8FRyImqA1NLAdV7XPkwGlvh12vMSZPcsSlMp
	CW6McyLy0cthLrPlA9gqDsm6YsolwauLBst9YoT6VVzWjcpLUtBdAS6XQxx2CbNUVxSQMB7vQAr
	W1kY3DWRv5550h9Ol/TFU5uyIK9jIgmS7RtQf9P9B2jLCL5IJw0aBQ5oh/lBlfUTdtmcoMOEsRC
	JHQecgiD0HdMdlwUHvBimVuHqeEG7bp+VVXGDtEoaVUoE+9HM7UYJjnDBIjqGyRAZFh3+OtC/Ke
	lPtZyw==
X-Google-Smtp-Source: AGHT+IER+f+QESk0mmrGrbqW5aft29vSPQF8tYLj2xS2lO4vOlUbR49BzE9eHlL6dcC132ghqDutGK86HQmZGB85hlI=
X-Received: by 2002:a05:6214:21ce:b0:720:7987:447b with SMTP id
 6a1803df08f44-72079874585mr17730446d6.17.1756803148058; Tue, 02 Sep 2025
 01:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250902075901.1550357-1-pierre-loup.gosse@smile.fr> <20250902075901.1550357-2-pierre-loup.gosse@smile.fr>
In-Reply-To: <20250902075901.1550357-2-pierre-loup.gosse@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 2 Sep 2025 10:52:16 +0200
X-Gm-Features: Ac12FXzju3U6GdPJxCBLWaH7-0HtbMkLEbckyGSY9FStMQHcbPeoWgE5feF0ma8
Message-ID: <CANNYZj8=jobXbb6606UtVxNLEPC=mLu9Layw4FpoAG7tt-LM8g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] wic: rename wks flag --extra-space to --extra-filesystem-space
To: pierre-loup.gosse@smile.fr
Cc: openembedded-core@lists.openembedded.org, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 08:52:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222716

Thanks, please also prepare and send documentation updates,
particularly in documentation/ref-manual/kickstart.rst (mentions
--extra-space and needs to be fixed/new option added) and
documentation/migration-guides/ (option rename is a breaking change,
new option is a new feature).

Alex

On Tue, 2 Sept 2025 at 09:59, <pierre-loup.gosse@smile.fr> wrote:
>
> From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>
> Makes a clear distinction with --extra-partition-space flag.
>
> Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>
> CC: Alexander Kanavin <alex.kanavin@gmail.com>
> CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> ---
> changes in v3:
> - adding this patch
>
> changes in v4:
> - no change
> ---
>  meta/lib/oeqa/selftest/cases/wic.py |  4 ++--
>  scripts/lib/wic/help.py             | 12 ++++++------
>  scripts/lib/wic/ksparser.py         | 25 +++++++++++++------------
>  scripts/lib/wic/partition.py        |  6 +++---
>  4 files changed, 24 insertions(+), 23 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
> index c9c9ceb0f2..3f75411059 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -1270,12 +1270,12 @@ run_wic_cmd() {
>              p, _ = self._get_wic_partitions(tempf.name, ignore_status=True)
>              self.assertNotEqual(p.status, 0, "wic exited successfully when an error was expected:\n%s" % p.output)
>
> -    def test_extra_space(self):
> +    def test_extra_filesystem_space(self):
>          native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
>
>          with NamedTemporaryFile("w", suffix=".wks") as tempf:
>              tempf.write("bootloader --ptable gpt\n" \
> -                        "part /     --source rootfs --ondisk hda --extra-space 200M --fstype=ext4\n")
> +                        "part /     --source rootfs --ondisk hda --extra-filesystem-space 200M --fstype=ext4\n")
>              tempf.flush()
>
>              _, partlns = self._get_wic_partitions(tempf.name, native_sysroot)
> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> index 800c0abf0f..6b49a67de9 100644
> --- a/scripts/lib/wic/help.py
> +++ b/scripts/lib/wic/help.py
> @@ -1013,12 +1013,12 @@ DESCRIPTION
>           --no-fstab-update: This option is specific to wic. It does not update the
>                              '/etc/fstab' stock file for the given partition.
>
> -         --extra-space: This option is specific to wic. It adds extra
> -                        space after the space filled by the content
> -                        of the partition. The final size can go
> -                        beyond the size specified by --size.
> -                        By default, 10MB. This option cannot be used
> -                        with --fixed-size option.
> +         --extra-filesystem-space: This option is specific to wic. It adds extra
> +                                   space after the space filled by the content
> +                                   of the partition. The final size can go
> +                                   beyond the size specified by --size.
> +                                   By default, 10MB. This option cannot be used
> +                                   with --fixed-size option.
>
>           --extra-partition-space: This option is specific to wic. It adds extra
>                                    empty space after the space filled by the
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index e86e1069f5..dbf0cf2dc3 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -132,7 +132,7 @@ def systemidtype(arg):
>  class KickStart():
>      """Kickstart parser implementation."""
>
> -    DEFAULT_EXTRA_SPACE = 10*1024
> +    DEFAULT_EXTRA_FILESYSTEM_SPACE = 10*1024
>      DEFAULT_OVERHEAD_FACTOR = 1.3
>
>      def __init__(self, confpath):
> @@ -153,7 +153,7 @@ class KickStart():
>          part.add_argument('--exclude-path', nargs='+')
>          part.add_argument('--include-path', nargs='+', action='append')
>          part.add_argument('--change-directory')
> -        part.add_argument("--extra-space", type=sizetype("M"))
> +        part.add_argument('--extra-filesystem-space', type=sizetype("M"))
>          part.add_argument('--extra-partition-space', type=sizetype("M"))
>          part.add_argument('--fsoptions', dest='fsopts')
>          part.add_argument('--fspassno', dest='fspassno')
> @@ -175,9 +175,9 @@ class KickStart():
>          part.add_argument('--hidden', action='store_true')
>
>          # --size and --fixed-size cannot be specified together; options
> -        # ----extra-space and --overhead-factor should also raise a parser
> -        # --error, but since nesting mutually exclusive groups does not work,
> -        # ----extra-space/--overhead-factor are handled later
> +        # ----extra-filesystem-space and --overhead-factor should also raise a
> +        # parser error, but since nesting mutually exclusive groups does not work,
> +        # ----extra-filesystem-space/--overhead-factor are handled later
>          sizeexcl = part.add_mutually_exclusive_group()
>          sizeexcl.add_argument('--size', type=sizetype("M"), default=0)
>          sizeexcl.add_argument('--fixed-size', type=sizetype("M"), default=0)
> @@ -264,12 +264,13 @@ class KickStart():
>                              parsed.extra_partition_space = 0
>                          # using ArgumentParser one cannot easily tell if option
>                          # was passed as argument, if said option has a default
> -                        # value; --overhead-factor/--extra-space cannot be used
> -                        # with --fixed-size, so at least detect when these were
> -                        # passed with non-0 values ...
> +                        # value; --overhead-factor/--extra-filesystem-space
> +                        # cannot be used with --fixed-size, so at least detect
> +                        # when these were passed with non-0 values ...
>                          if parsed.fixed_size:
> -                            if parsed.overhead_factor or parsed.extra_space:
> -                                err = "%s:%d: arguments --overhead-factor and --extra-space not "\
> +                            if parsed.overhead_factor or parsed.extra_filesystem_space:
> +                                err = "%s:%d: arguments --overhead-factor and "\
> +                                      "--extra-filesystem-space not "\
>                                        "allowed with argument --fixed-size" \
>                                        % (confpath, lineno)
>                                  raise KickStartError(err)
> @@ -280,8 +281,8 @@ class KickStart():
>                              # with value equal to 0)
>                              if '--overhead-factor' not in line_args:
>                                  parsed.overhead_factor = self.DEFAULT_OVERHEAD_FACTOR
> -                            if '--extra-space' not in line_args:
> -                                parsed.extra_space = self.DEFAULT_EXTRA_SPACE
> +                            if '--extra-filesystem-space' not in line_args:
> +                                parsed.extra_filesystem_space = self.DEFAULT_EXTRA_FILESYSTEM_SPACE
>
>                          self.partnum += 1
>                          self.partitions.append(Partition(parsed, self.partnum))
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index d358aabbd6..0c9b1a5b96 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -28,7 +28,7 @@ class Partition():
>          self.align = args.align
>          self.disk = args.disk
>          self.device = None
> -        self.extra_space = args.extra_space
> +        self.extra_filesystem_space = args.extra_filesystem_space
>          self.extra_partition_space = args.extra_partition_space
>          self.exclude_path = args.exclude_path
>          self.include_path = args.include_path
> @@ -104,8 +104,8 @@ class Partition():
>                                 (actual_rootfs_size, rootfs_size))
>          else:
>              extra_blocks = self.get_extra_block_count(actual_rootfs_size)
> -            if extra_blocks < self.extra_space:
> -                extra_blocks = self.extra_space
> +            if extra_blocks < self.extra_filesystem_space:
> +                extra_blocks = self.extra_filesystem_space
>
>              rootfs_size = actual_rootfs_size + extra_blocks
>              rootfs_size = int(rootfs_size * self.overhead_factor)
> --
> 2.34.1
>

