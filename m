Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web12.7647.1593081789214744905
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=iGE6P0JY;
 spf=pass (domain: konsulko.com, ip: 209.85.210.66, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f66.google.com with SMTP id n24so2550380otr.13
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 03:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wphN8h66VZwlAsPHlYeD/J4uxoAoRc16ZrT7Zfs9Cwo=;
        b=iGE6P0JYaDj0uwO7IgF1l3Ym1oXWA/6GxcJW8iqa3AFk6V6xFQ4CCxAFyRkdGbFWw1
         kQb2SahLzKVaNOcxGj7o+fFMgbouV7QHNTy0V58wcLAoKyRIPW1HJScFAb4t/GMCmOYd
         J+6B2pcxqRorbsIJtjxGToHZr1DCGc+XlarCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wphN8h66VZwlAsPHlYeD/J4uxoAoRc16ZrT7Zfs9Cwo=;
        b=CN4fb8XSzL+CfieTcMoke6UA9p4MI71lZenZUhjjivxoafrbsDyzPuln27kRXeHiZG
         0U90bbVRMhDese99Vqpwc8KZHJDGV1OXpUpnwZDfIt7ofiTrSXu2NhFSB+sMF/Let/ej
         bu3eS9juc7RBZIQtzHRvXmelQxyswd3PjEZtxH1ZpDpLBOsXnd0vg5Yyav+7r0xX42SE
         cqKHX30eL0N10WlJmIweusrETlMMUzkPkLlhYxDyrEPfsUkxETsJ00ePSzzxQggcJGAl
         b198/eO+mEVQPxK1mhfgvWIn4W730AMpjotp6Gr/U5d6EhpPT/iuL1lR6Nw54C5u8aoq
         BfLg==
X-Gm-Message-State: AOAM531FUR9k36wP7sasoxZNR9bZAoAyu0U6Er1/RVFFanvBxK1Vnz9r
	1/g2MAbF4EMTlVBBFF2CwjbOyet6kcQTo3P4HE7uLlpD
X-Google-Smtp-Source: ABdhPJxgyVyLXEdFgif3Zvx3YlSApQqMGuubenkgibnav3NPc8op+HkkoX6JPYO1HQr41prIC5NUZmhAJzqy/3FkSaI=
X-Received: by 2002:a05:6830:22ee:: with SMTP id t14mr26992132otc.92.1593081788459;
 Thu, 25 Jun 2020 03:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200625102145.7139-1-fredrigu@axis.com> <20200625102145.7139-23-fredrigu@axis.com>
In-Reply-To: <20200625102145.7139-23-fredrigu@axis.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Thu, 25 Jun 2020 11:42:58 +0100
Message-ID: <CAM9ZRVs=B5v+cuee1aEA=iab9_S3DCzf71SNYthRSp3DaYA6GQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 22/26] package_manager: Rename Indexer classes
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>, Hugo Cedervall <hugo.cedervall@axis.com>, 
	Fredrik Gustafsson <fredrigu@axis.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jun 2020 at 11:22, Fredrik Gustafsson
<fredrik.gustafsson@axis.com> wrote:
>
> Rename all *Indexer classeds to PkgIndexer to enable dynamic calling.

Typo: classes.

>
> Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
> ---
>  meta/lib/oe/package_manager.py                | 22 +++++--------------
>  .../package_managers/deb/package_manager.py   |  8 +++++--
>  .../package_managers/ipk/package_manager.py   |  7 ++++--
>  .../package_managers/rpm/package_manager.py   |  5 ++++-
>  4 files changed, 20 insertions(+), 22 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index 111845d903..bfddbce93c 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -149,8 +149,6 @@ class Indexer(object, metaclass=ABCMeta):
>      def write_index(self):
>          pass
>
> -
> -
>  class PkgsList(object, metaclass=ABCMeta):
>      def __init__(self, d, rootfs_dir):
>          self.d = d
> @@ -576,22 +574,12 @@ def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencie
>                          raise
>
>  def generate_index_files(d):
> -    classes = d.getVar('PACKAGE_CLASSES').replace("package_", "").split()
> -
> -    indexer_map = {
> -        "rpm": (RpmSubdirIndexer, d.getVar('DEPLOY_DIR_RPM')),
> -        "ipk": (OpkgIndexer, d.getVar('DEPLOY_DIR_IPK')),
> -        "deb": (DpkgIndexer, d.getVar('DEPLOY_DIR_DEB'))
> -    }
> -
> +    classes = d.getVar('PACKAGE_CLASSES').split()
>      result = None
>
>      for pkg_class in classes:
> -        if not pkg_class in indexer_map:
> -            continue
> -
> -        if os.path.exists(indexer_map[pkg_class][1]):
> -            result = indexer_map[pkg_class][0](d, indexer_map[pkg_class][1]).write_index()
> +        import importlib
> +        result = importlib.import_module('oe.package_managers.' + classes + '.manifest').PkgIndexer(d).write_index()
>
> -            if result is not None:
> -                bb.fatal(result)
> +        if result is not None:
> +            bb.fatal(result)
> diff --git a/meta/lib/oe/package_managers/deb/package_manager.py b/meta/lib/oe/package_managers/deb/package_manager.py
> index 5d3c300700..0dc4004f66 100644
> --- a/meta/lib/oe/package_managers/deb/package_manager.py
> +++ b/meta/lib/oe/package_managers/deb/package_manager.py
> @@ -94,7 +94,7 @@ class PkgPM(OpkgDpkgPM):
>
>          self._create_configs(archs, base_archs)
>
> -        self.indexer = DpkgIndexer(self.d, self.deploy_dir)
> +        self.indexer = PkgIndexer(self.d, self.deploy_dir)
>
>      def mark_packages(self, status_tag, packages=None):
>          """
> @@ -400,7 +400,7 @@ class PkgPM(OpkgDpkgPM):
>          return tmp_dir
>
>
> -class DpkgIndexer(Indexer):
> +class PkgIndexer(Indexer):
>      def _create_configs(self):
>          bb.utils.mkdirhier(self.apt_conf_dir)
>          bb.utils.mkdirhier(os.path.join(self.apt_conf_dir, "lists", "partial"))
> @@ -423,6 +423,10 @@ class DpkgIndexer(Indexer):
>                      apt_conf.write(line + "\n")
>
>      def write_index(self):
> +        if self.deploy_dir == "":
> +            self.deploy_dir = self.d.getVar('DEPLOY_DIR_DEB')
> +
> +
>          self.apt_conf_dir = os.path.join(self.d.expand("${APTCONF_TARGET}"),
>                  "apt-ftparchive")
>          self.apt_conf_file = os.path.join(self.apt_conf_dir, "apt.conf")
> diff --git a/meta/lib/oe/package_managers/ipk/package_manager.py b/meta/lib/oe/package_managers/ipk/package_manager.py
> index 8abc6c1c98..133af27182 100644
> --- a/meta/lib/oe/package_managers/ipk/package_manager.py
> +++ b/meta/lib/oe/package_managers/ipk/package_manager.py
> @@ -106,7 +106,7 @@ class PkgPM(OpkgDpkgPM):
>          else:
>              self._create_config()
>
> -        self.indexer = OpkgIndexer(self.d, self.deploy_dir)
> +        self.indexer = PkgIndexer(self.d, self.deploy_dir)
>
>      def mark_packages(self, status_tag, packages=None):
>          """
> @@ -423,8 +423,11 @@ class PkgPM(OpkgDpkgPM):
>
>          return tmp_dir
>
> -class OpkgIndexer(Indexer):
> +class PkgIndexer(Indexer):
>      def write_index(self):
> +        if self.deploy_dir == "":
> +            self.deploy_dir = self.d.getVar('DEPLOY_DIR_IPK')
> +
>          arch_vars = ["ALL_MULTILIB_PACKAGE_ARCHS",
>                       "SDK_PACKAGE_ARCHS",
>                       ]
> diff --git a/meta/lib/oe/package_managers/rpm/package_manager.py b/meta/lib/oe/package_managers/rpm/package_manager.py
> index 025e8cdfd2..e781676183 100644
> --- a/meta/lib/oe/package_managers/rpm/package_manager.py
> +++ b/meta/lib/oe/package_managers/rpm/package_manager.py
> @@ -384,8 +384,11 @@ class RpmIndexer(Indexer):
>                                 self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE'),
>                                 armor=is_ascii_sig)
>
> -class RpmSubdirIndexer(RpmIndexer):
> +class PkgIndexer(RpmIndexer):
>      def write_index(self):
> +        if self.deploy_dir == "":
> +            self.deploy_dir = self.d.getVar('DEPLOY_DIR_RPM')
> +
>          bb.note("Generating package index for %s" %(self.deploy_dir))
>          self.do_write_index(self.deploy_dir)
>          for entry in os.walk(self.deploy_dir):

As per previous comments, let's delay this for a later series. Also
please keep whitespace changes separate from functional changes.


--
Paul Barker
Konsulko Group
