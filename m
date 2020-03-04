Return-Path: <pbarker@konsulko.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id A405461625
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 09:53:40 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v4so1555360wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 01:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=xDJoga11wxsmGgspC5BQLA6gzlpjHYU62LEC/yxzMBo=;
	b=qPTDiJOM1jbBan6y0O98XMHLeuwyfixNuAMivSsK8Ln0l/VVyWDJLHZSHmUCtqL7Ya
	pr199D7wCGo0NoRN6huRD0V6/EVpJYkoPlpi0cdwZbsfvRafMUoS43/PzsgXw61TdRdn
	AEMUEA49t+c+qhlAOKZlcbaZrRJQXaKlbakC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=xDJoga11wxsmGgspC5BQLA6gzlpjHYU62LEC/yxzMBo=;
	b=fjxh3dGIRhwOffsq97Jl4cVrSQLCrVdlKVFw8331Arib4wqPdVTTRqm4r1sl6M2Yky
	ynqZhtcbpofdWLiy4DxhFaSqYNtzfXaxhYMTuwueBpxhoH6U0HALj52YhvMMHXHNcuBg
	RzUZiB1KMjwdrzFVE5mDnJSNfktklhPfQIihlCyBDowKFAnn+VV+5bsf1CrY6//+mJHW
	LE+2LthRwYE4y2jP5mkLUmt1lhwRKyk30pJX9zrELpY8QPNpEroDxO7hJCEVrEOF6lDw
	Ndj3pg50xi/Sy4SnkOMsaBhgbOumL9lsabCvDgK3s9Eq7+qbCLL4xaUfnCE/tLXbdQv+
	fhFA==
X-Gm-Message-State: ANhLgQ1UtaLWgyvH89YpryE3zYrE41Cqc0LrUA5VcGKIMMQ863mm0Os7
	MbKrH09MIusRS+jOd5JqnBGiizu4tdVW9qDc
X-Google-Smtp-Source: ADFU+vtmp9uAxvuco8ufHRv9D+7gGVCH/YwdFMH6WkQY6pDzsLZ6sNOhThjV6cYmgEdbv57DwTdhaQ==
X-Received: by 2002:adf:d081:: with SMTP id y1mr3244084wrh.408.1583315621241; 
	Wed, 04 Mar 2020 01:53:41 -0800 (PST)
Received: from ub1910 ([213.48.11.149]) by smtp.gmail.com with ESMTPSA id
	u1sm19890485wrt.78.2020.03.04.01.53.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 01:53:41 -0800 (PST)
Date: Wed, 4 Mar 2020 09:53:34 +0000
From: Paul Barker <pbarker@konsulko.com>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Message-ID: <20200304095334.1f20ddd9@ub1910>
In-Reply-To: <20200304083438.1022216-1-ricardo@ribalda.com>
References: <20200304083438.1022216-1-ricardo@ribalda.com>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] wic: Fix permissions when using exclude or include path
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
X-List-Received-Date: Wed, 04 Mar 2020 09:53:41 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  4 Mar 2020 09:34:37 +0100
Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:

> When parameters include_path or exclude_path are passed to the rootfs
> plugin, it will copy the partition content into a folder and make all
> the modifications there.
> 
> This is done using copyhardlinktree(), which does not take into
> consideration the content of the pseudo folder, which contains the
> information about the right permissions and ownership of the folders.

How are you running wic here? In the do_image_wic task it's executed under
pseudo so all this is handled already. Executing wic outside of bitbake may
need some more testing here.

> 
> This results in a rootfs owned by the user that is running the wic
> command (usually UID 1000), which makes some rootfs unbootable.
> 
> To fix this we copy the content of the pseudo folders to the new folder
> and modify the pseudo database using the "pseudo -B" command.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> ---
>  scripts/lib/wic/plugins/source/rootfs.py | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
> index 705aeb5563..40419a64b3 100644
> --- a/scripts/lib/wic/plugins/source/rootfs.py
> +++ b/scripts/lib/wic/plugins/source/rootfs.py
> @@ -16,11 +16,11 @@ import os
>  import shutil
>  import sys
>  
> -from oe.path import copyhardlinktree
> +from oe.path import copyhardlinktree, copytree
>  
>  from wic import WicError
>  from wic.pluginbase import SourcePlugin
> -from wic.misc import get_bitbake_var
> +from wic.misc import get_bitbake_var, exec_native_cmd
>  
>  logger = logging.getLogger('wic')
>  
> @@ -44,6 +44,15 @@ class RootfsPlugin(SourcePlugin):
>  
>          return os.path.realpath(image_rootfs_dir)
>  
> +    @staticmethod
> +    def __get_pseudo(native_sysroot, rootfs):
> +        pseudo = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
> +        pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % os.path.join(rootfs, "../pseudo")
> +        pseudo += "export PSEUDO_PASSWD=%s;" % rootfs
> +        pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
> +        pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
> +        return pseudo
> +
>      @classmethod
>      def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
>                               oe_builddir, bootimg_dir, kernel_dir,
> @@ -78,9 +87,16 @@ class RootfsPlugin(SourcePlugin):
>  
>              if os.path.lexists(new_rootfs):
>                  shutil.rmtree(os.path.join(new_rootfs))
> -
>              copyhardlinktree(part.rootfs_dir, new_rootfs)
>  
> +            if os.path.lexists(os.path.join(new_rootfs, "../pseudo")):
> +                shutil.rmtree(os.path.join(new_rootfs, "../pseudo"))
> +            copytree(os.path.join(part.rootfs_dir, "../pseudo"),
> +                     os.path.join(new_rootfs, "../pseudo"))

I don't like stepping up the directory tree like this. We should be more
explicit with the paths.

> +            pseudo_cmd = "%s -B -m %s -M %s" % (cls.__get_pseudo(native_sysroot,new_rootfs),
> +                                                part.rootfs_dir, new_rootfs)
> +            exec_native_cmd(pseudo_cmd, native_sysroot)
> +
>              for path in part.include_path or []:
>                  copyhardlinktree(path, new_rootfs)

                   ^^^^^^^^^^^^^^^^

If this is the right approach I imagine you would also need to fix things up
with pseudo after the copyhardlinktree call above.

-- 
Paul Barker
Konsulko Group

