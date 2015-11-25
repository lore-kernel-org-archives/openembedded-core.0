Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 01FB86011D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 08:42:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAP8gxXe007549
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Nov 2015 00:43:00 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 25 Nov 2015 00:42:59 -0800
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>,
	<openembedded-core@lists.openembedded.org>
References: <1448434479-29558-1-git-send-email-jkrishnanjanappa@mvista.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56557491.4010809@windriver.com>
Date: Wed, 25 Nov 2015 16:42:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1448434479-29558-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: Re: [jethro][PATCH] license.bbclass: fix host contamination warnings for license files
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
X-List-Received-Date: Wed, 25 Nov 2015 08:43:00 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Jagadeesh,

Thanks, usually, patch should go into master branch before go into stable
branch such as jethro. IMHO, jethro branch may not take this fix even if
master merges it. The problem is that oe-core doesn't create package for
${PN}-lic atm, this patch is treated as part of the enhancement which is
used for working with creating ${PN}-lic.

// Robert

On 11/25/2015 02:54 PM, Jagadeesh Krishnanjanappa wrote:
> We get below host contamination warnings of license files for
> each recipe, when we try to create a separate ${PN}-lic package (which
> contains license files), by setting LICENSE_CREATE_PACKAGE equal to "1"
> in local.conf.
>
> -- snip --
> WARNING: QA Issue: libcgroup: /libcgroup-lic/usr/share/licenses/libcgroup/generic_LGPLv2.1 is owned by uid 5001, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> WARNING: QA Issue: attr: /attr-lic/usr/share/licenses/attr/libattr.c is owned by uid 5001, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> WARNING: QA Issue: bash: /bash-lic/usr/share/licenses/bash/COPYING is owned by uid 5001, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> -- CUT --
>
> Since the license files from source and OE-core, are populated in a normal
> shell environment rather in pseudo environment (fakeroot); the ownership of
> these files will be same as host user running bitbake. During the do_package
> task (which runs in pseudo environment (fakeroot)), os.link preserves the
> ownership of these license files as host user instead of root user.
> This causes license files to have UID same as host user id and resulting in
> above warnings during do_package_qa task.
>
> Changing ownership of license files to root user under fakeroot environment
> will solve above warnings, and on exiting fakeroot environment the license
> files will continue to be owned by host user.
>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>   meta/classes/license.bbclass | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index c616a20..d400ac0 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -185,6 +185,7 @@ def copy_license_files(lic_files_paths, destdir):
>                   os.remove(dst)
>               if os.access(src, os.W_OK) and (os.stat(src).st_dev == os.stat(destdir).st_dev):
>                   os.link(src, dst)
> +                os.chown(dst,os.getuid(),os.getgid())
>               else:
>                   shutil.copyfile(src, dst)
>           except Exception as e:
>

