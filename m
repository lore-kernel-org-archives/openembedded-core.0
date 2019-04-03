Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 087877D2D5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 12:47:58 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id j9so21163137wrn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 05:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=zKe2tvgwCnfW78GQhPuj6/nPkc2qdYpq+fou2I0pJ+s=;
	b=danuHVrS05mxy90pYAghtCzzHIJ9XTU0AlOeIDEtW7Z7EowKDBUSGCn4Qglr+4c1hn
	h/N1dYi4s2rNFz+kRU+4h4mO2ceLIMR2wu0FQ5R9VCjRtGgz1/kO7DXu630hpckJNXiy
	Iep1SQfLdNN01G1k5V2zQLWtv8tcjYCl2gNZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=zKe2tvgwCnfW78GQhPuj6/nPkc2qdYpq+fou2I0pJ+s=;
	b=auaL3lVLafBpn8bhs/zzlYxlq+v310vlTJ4E0wGRECB5XioAuwOin0gJKJn23C+PC0
	iX2ewF31haNC04+bQ/kfifcAL6w7M+v1PLqWzRMjXqxGWYY1UEQQYcXUhRNF3G/iihZ5
	G+EVuXfv6bqFHzPoB/axyHsy3ocfmnP0Wgu9RHlx63ljINJaWuXf0TtNBIAF6YhBUTAi
	pGq2BmstBebOMT6KeNEC053L6t37iFMeMBgrKyQYSjqiQDcjjb0fjr00AwOUFbbNzAji
	zALfmojHD4G0tPf1hiul9ey2AoPjsA4F+0wATfsLGiIUW5U2haYkpa5Hx3bYBdcTPxaN
	r9JA==
X-Gm-Message-State: APjAAAV8jq5THfqpJW3Iy73k9mRdXdDFOyJS88l1hk0cwxXXUp4x/vhz
	bTLdOn09IPzO24o9uMIXgUvlFQ==
X-Google-Smtp-Source: APXvYqznVQ+Ce1Hg+fKIFJ0vfG+I5kz33OkUIKyopBICyBKeCfDlKuGKDVYlUDmffxCrmxV2cuclMQ==
X-Received: by 2002:adf:e648:: with SMTP id b8mr44272527wrn.132.1554295679669; 
	Wed, 03 Apr 2019 05:47:59 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v190sm40782265wme.18.2019.04.03.05.47.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 Apr 2019 05:47:58 -0700 (PDT)
Message-ID: <866ba68abe94b19205b70f59a512c68ef65b79a1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 03 Apr 2019 13:47:57 +0100
In-Reply-To: <20190403122626.18451-1-pkj@axis.com>
References: <20190403122626.18451-1-pkj@axis.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH] useradd.bbclass: Make sure users/groups exist for package_write_* tasks
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
X-List-Received-Date: Wed, 03 Apr 2019 12:47:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-04-03 at 14:26 +0200, Peter Kjellerstedt wrote:
> If the populate_lic task and any of the package_write_* tasks need to
> run, but the package task can be restored from the sstate cache, then
> the fetch task, which is a dependency of populate_lic, will wipe out
> the RSS including any users/groups that have been created. This
> results in that the package_write_* tasks are run without any
> user/group information, which causes them to fallback to either use
> the root user for any unknown users/groups (rpm) or to use the
> numeric
> UIDs/GIDs (deb/ipk). Neither solution will yield correct packages.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/classes/useradd.bbclass | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/useradd.bbclass
> b/meta/classes/useradd.bbclass
> index 124becd082..e32315a1af 100644
> --- a/meta/classes/useradd.bbclass
> +++ b/meta/classes/useradd.bbclass
> @@ -4,7 +4,7 @@ inherit useradd_base
>  # target sysroot, and shadow -native and -sysroot provide the
> utilities
>  # and support files needed to add and modify user and group accounts
>  DEPENDS_append_class-target = " base-files shadow-native shadow-
> sysroot shadow base-passwd"
> -PACKAGE_WRITE_DEPS += "shadow-native"
> +PACKAGE_WRITE_DEPS += "shadow-native shadow-sysroot base-passwd"
>  
>  # This preinstall function can be run in four different contexts:
>  #
> @@ -144,7 +144,10 @@ python useradd_sysroot_sstate () {
>      task = d.getVar("BB_CURRENTTASK")
>      if task == "package_setscene":
>          bb.build.exec_func("useradd_sysroot", d)
> -    elif task == "prepare_recipe_sysroot":
> +    elif (task == "prepare_recipe_sysroot" or
> +          task == "package_write_deb" or
> +          task == "package_write_ipk" or
> +          task == "package_write_rpm"):
>          # Used to update this recipe's own sysroot so the
> user/groups are available to do_install
>          scriptfile = d.expand("${RECIPE_SYSROOT}${bindir}/postinst-
> useradd-${PN}")
>          bb.build.exec_func("useradd_sysroot", d)
> @@ -161,13 +164,16 @@ python useradd_sysroot_sstate () {
>          os.chmod(scriptfile, 0o755)
>  }
>  
> -do_prepare_recipe_sysroot[postfuncs] += "${SYSROOTFUNC}"
> -SYSROOTFUNC_class-target = "useradd_sysroot_sstate"
>  SYSROOTFUNC = ""
> +SYSROOTFUNC_class-target = "useradd_sysroot_sstate"
>  
> -SYSROOT_PREPROCESS_FUNCS += "${SYSROOTFUNC}"
> +do_prepare_recipe_sysroot[postfuncs] += "${SYSROOTFUNC}"
> +do_package_write_deb[prefuncs] += "${SYSROOTFUNC}"
> +do_package_write_ipk[prefuncs] += "${SYSROOTFUNC}"
> +do_package_write_rpm[prefuncs] += "${SYSROOTFUNC}"
>  
> -SSTATEPREINSTFUNCS_append_class-target = " useradd_sysroot_sstate"
> +SYSROOT_PREPROCESS_FUNCS += "${SYSROOTFUNC}"
> +SSTATEPREINSTFUNCS += "${SYSROOTFUNC}"
>  
>  do_package_setscene[depends] += "${USERADDSETSCENEDEPS}"
>  do_populate_sysroot_setscene[depends] += "${USERADDSETSCENEDEPS}"

This may be a bigger problem that just package_write_*.

This feels like a bad thing to do since there may be other tasks which
also rely on the user information being present. This probably only
fixes one corner case but there are likey others :(.

Possible solutions might be:

a) To wipe out all sstate tasks if we're rerunning do_fetch
b) Preserve the user/group information around the cleaning of the
sysroot

I think we may need to fix this generically...

Cheers,

Richard


