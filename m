Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f51.google.com (mail-vb0-f51.google.com
	[209.85.212.51])
	by mail.openembedded.org (Postfix) with ESMTP id 972E56B23E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 12:27:48 +0000 (UTC)
Received: by mail-vb0-f51.google.com with SMTP id x17so1318331vbf.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 05:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=SPcIfC84UgpYz3lTGKMzzwhFPXXQVIR2GXbdxXA17nQ=;
	b=IVcOjRLE9hJGEZwkPGMXFcjzgF0SgrGf5/qPxa8A/3mNmiakT1JLYvh1fFCScQA3iC
	XhW35w0xsmcULKr0oD8nSF8L81vHTSHUOEsddnweR3Jz2E/27JzbdM4h3rg0pA/MIgt9
	DQwaEddI8q1bR3AHJSwNQdCE/rvnbO0ixv79lj91Fl+lMolohVMcDTJSGaqzWwvcvWLo
	pZ66HwwnI0g5TRqejHEWEBWxI9PdvmHyGRogvAYgLqTe8isDPmM3C+yreMf7AsTMZQG0
	UwG2mB7m8MxIAp2WNCI05+eVYEteAbFAGtjL2SUIEi1Lu1NCRC/tTI3hxNXUVT2tHhNE
	Q0Tw==
X-Received: by 10.58.233.8 with SMTP id ts8mr1969387vec.44.1374064069076; Wed,
	17 Jul 2013 05:27:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Wed, 17 Jul 2013 05:27:28 -0700 (PDT)
In-Reply-To: <51E3E01D.9050905@mentor.com>
References: <1373528728-27268-1-git-send-email-muhammad_shakeel@mentor.com>
	<51DEF360.8030509@linux.intel.com>
	<53609789-437E-429A-997E-7A1BECF21A48@mentor.com>
	<51DEFA34.70405@linux.intel.com>
	<CAJTo0LYmH8sDrpfYOhSd8WXKeoKGd-JiVu1EHMuj5vRLYBcxtQ@mail.gmail.com>
	<51E3E01D.9050905@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Jul 2013 13:27:28 +0100
Message-ID: <CAJTo0LZcwThT2T7VXWO-R2b7OyXzFMoeD=5hSs8-6xycU0G9WQ@mail.gmail.com>
To: Muhammad Shakeel <muhammad_shakeel@mentor.com>
X-Gm-Message-State: ALoCoQnnQwyTckFfrqjnHOfpmX+B3O+K7IgX9tYKWYtqixeJfMQvnZv+BENso/KuAuz5JXV1kxdu
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [v2] openssh: Enabling with systemd
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
X-List-Received-Date: Wed, 17 Jul 2013 12:27:49 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 15 July 2013 12:42, Muhammad Shakeel <muhammad_shakeel@mentor.com> wrote:
> We can also easily move 'sed' part to systemd class because we will only be
> looking for all the service files in ${systemd_unitdir}, irrespective of
> how these got installed.
>
> I gave a little thought to move the installation part into the class and
> there
> can be a solution but probably little complicated. The neatest solution
> would
> be to define an another variable say 'SYSTEMD_SERVICE_FILES_{PN}'
> which will hold the name of all the service files, need to be installed,
> along
> with their relative path from WORKDIR. We can check in systemd class that if
> ${systemd_unitdir} is not present, means upstream hasn't installed anything,
> then install whatever is in 'SYSTEMD_SERVICE_FILES_{PN}'.
>
> Other option is to reuse current 'SYSTEMD_SERVICE_${PN}' that lists the
> service
> files in the package but doesn't include the path of service files. If we do
> not
> want a new variable, which seems like a duplication, then we can add the
> path
> with the service files in this variable and tweak systemd class to handle
> this in
> current implementation. We will add the path only if service file to be
> installed is
> not present in WORKDIR but buried somewhere in the package source.

Installation of unit files will only be used in packages that don't
ship their own, which will be reducing over time as more upstream
packages integrate the files, so I don't think it's worthwhile writing
some complicated logic for a diminishing need.  I still think that
adding do_install_append() functions to systemd.bbclass and
update-rcd.bbclass to check the DISTRO_FEATURES and remove init
scripts as required would give us a lot more clarity in the recipes
without much "magic".

Ross

