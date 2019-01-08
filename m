Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f170.google.com (mail-it1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id BF36D7BF14
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 12:27:48 +0000 (UTC)
Received: by mail-it1-f170.google.com with SMTP id a6so5684099itl.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 04:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bHUEcA47X2yGcgKIJnL2+gxTnna5GGjpL1dxUxx7wKQ=;
	b=eCuqSPfQ/zkJmFaWV06cTrbkOtn3vF/v0YiRuIOugxaSIzQkZ4mnDuGdBYB2mcPjBQ
	lJxeDqHX1eXH6RMLQCDCwsD+uAX5vuVsHoBNsKd+Y3yc4k2EUEHhczFDWo3vrnpuqWiz
	8kxSh0Och3TknP86TvyzAK/wcRbAnPVZ41OCdep4/UTAtV9/U5iiCb6ANEPEceo/+c5P
	HD0E9Bdgcm9Cf7tru9Nh3l+xdFzinmsK/nySGLQ4OIIVIzvIo7bLpM/s0doaf+3F3enZ
	8vc9h7CaDV5I246kqW/719x4+QRLQQJuoQYpNIW8jQlV++MvJVMX0/QeC4krbLXWE4VT
	RgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bHUEcA47X2yGcgKIJnL2+gxTnna5GGjpL1dxUxx7wKQ=;
	b=RJK3EIGXo4oSXXZbqW/SKfcvSDQUj86C1pWJOnZOTZ8mBbN72yyEcynBWefkjsgzSR
	4jstC5+JxZ0A1CKs9AZVBhsMeMAZ5FeZoqGFXHhrJkWQFEppYRhQWZA8rRp7dZdC5kIm
	MUc/4fpscuoK6hucVJqa+IgBL46YNgpTPYD3+AE/3D2+2JkSZMp7COtYOakyRY4SXZTe
	0zYmqYhXlcbOCzqvTciOEr6oeaXE1ffCL+J700Q+BZig1djWbEhARrYKXtqPr08h0dVq
	wIC5QwJ48xAoFk5YSYkxh0S/NA9A/uM+0kFpyj98IZKjxjoYDDMDfqyIlrzieMKA8a7p
	ZGZA==
X-Gm-Message-State: AJcUukcvRdHVlLtOEBtu50XTfaMfdTO25XuQ3/4ABMcTm+vlDQjyqb4z
	ubNUhDz9XmqIzDImZ8Hxgz35vD49wC65XhChPior2Q==
X-Google-Smtp-Source: ALg8bN6PW89GeD5dVUMbTvxy1JNEHj18jOwVoUUDiyb+OYj1ix7etrPc4nDcvt6y/7gjjDueNJAZ4+9AqVj7m1InHk8=
X-Received: by 2002:a24:1d4a:: with SMTP id 71mr1038646itj.62.1546950469817;
	Tue, 08 Jan 2019 04:27:49 -0800 (PST)
MIME-Version: 1.0
References: <05af53a7-6ed6-9615-be2e-d8c31dbfb321@siemens.com>
In-Reply-To: <05af53a7-6ed6-9615-be2e-d8c31dbfb321@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Jan 2019 12:27:38 +0000
Message-ID: <CAJTo0LbHTnSYrjm6QWGbXFJFj8jUGuk07t6hAhgB8dUnSYkAxw@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>,
	Mark Hatle <mark.hatle@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Prelink problem
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
X-List-Received-Date: Tue, 08 Jan 2019 12:27:49 -0000
Content-Type: text/plain; charset="UTF-8"

That patch removed the dependency on the QA, but your failure is at rootfs time.

No idea why the opkg rootfs code is doing prelink operations when RPM
or dpkg don't.   CCing Mark who may have an idea here.  I thought the
autobuilder exerised multilib-on-opkg, but maybe not.

Ross

On Tue, 8 Jan 2019 at 07:14, Andrej Valek <andrej.valek@siemens.com> wrote:
>
> Hi Ross,
>
> I would like to ask You a question about your commit, which removed
> prelink dependency
> (http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/classes/insane.bbclass?h=thud&id=659c8b5267dc2220f67bfcb4ae2df91ae5052cdc).
> Is it really necessary to remove the QADEPENDS = "prelink-native"?
>
> I was trying to build extensible SDK with multilib support, but without
> success. Here is the crash log:
>
>      0709:        if not os.path.exists(prelink_cfg):
>
>      0710:
> shutil.copy(self.d.expand('${STAGING_DIR_NATIVE}${sysconfdir_native}/prelink.conf'),
>
>  *** 0711:                        prelink_cfg)
>
>      0712:
>
>      0713:        cmd_prelink =
> self.d.expand('${STAGING_DIR_NATIVE}${sbindir_native}/prelink')
>
>      0714:        self._exec_shell_cmd([cmd_prelink,
>
>      0715:                              '--root',
>
> File: '/usr/lib/python3.5/shutil.py', lineno: 241, function: copy
>
>      0237:
>
>      0238:    """
>
>      0239:    if os.path.isdir(dst):
>
>      0240:        dst = os.path.join(dst, os.path.basename(src))
>
>  *** 0241:    copyfile(src, dst, follow_symlinks=follow_symlinks)
>
>      0242:    copymode(src, dst, follow_symlinks=follow_symlinks)
>
>      0243:    return dst
>
>      0244:
>
>      0245:def copy2(src, dst, *, follow_symlinks=True):
>
> File: '/usr/lib/python3.5/shutil.py', lineno: 120, function: copyfile
>
>      0116:
>
>      0117:    if not follow_symlinks and os.path.islink(src):
>
>      0118:        os.symlink(os.readlink(src), dst)
>
>      0119:    else:
>
>  *** 0120:        with open(src, 'rb') as fsrc:
>
>      0121:            with open(dst, 'wb') as fdst:
>
>      0122:                copyfileobj(fsrc, fdst)
>
>      0123:    return dst
>
>      0124:
>
> Exception: FileNotFoundError: [Errno 2] No such file or directory:
> '/home/.../1.0-r0/recipe-sysroot-native/etc/prelink.conf'
>
>
> It points into meta/lib/oe/rootfs.py:705
>
> if not os.path.exists(prelink_cfg):
>
> shutil.copy(self.d.expand('${STAGING_DIR_NATIVE}${sysconfdir_native}/prelink.conf'),prelink_cfg)
>
>
> How it's possible to copy non-existing file, because of removed
> prelink-native dependency.
>
> Do I need to explicitly inherit some class, let say image-prelink?
> What am I doing wrong?
>
> Regards,
> Andrej

