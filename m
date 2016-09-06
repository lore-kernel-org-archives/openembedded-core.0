Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9A2773B7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 15:22:59 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id b187so70431332wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Sep 2016 08:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sW0Hs1Cq/XmTq2p/1zL7I20QCIvBTeJWo5zMIFHtbNU=;
	b=hVUgsjNkmy3PdxNohLYPGFcSLxEhEwZPwQUmvTUy0kIRWOXtIlTBr1+TMd6YIRsct8
	egoOy4OMFZBu38fq7vA10DqBDCvJWsl3eIWa4sZOlDBSbTgruX8cRYGIWs0rRu3iqHjb
	QtL9hnO0Rg8BmMVp2jgieQaJDfMfpro0EN+K0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sW0Hs1Cq/XmTq2p/1zL7I20QCIvBTeJWo5zMIFHtbNU=;
	b=L33Dev/2fwpgOL8oGvoOymZhsE0IyRrP6wCZNb8/CRluFajRm1r2G+QH/vwBWZrCmR
	PJyswbe15L9hrbukS3t91QspXAZcFfsC2FWHopX3MOsU2p7M89Xe07rewE4GW4lmv+zj
	DNXYyoNghAuak8fgFKhg7heknXhcx+8kKhUbM0OMEnUrbp3ZHNhLcXcYnaM4w+b1LbbS
	cvlUw3Tm1Iqo3wsrQggBG07Tfzd4GsC5f8XJ/aMe/SQ5kHuVLbPQMtI/vPBKVGnQnves
	a1kiaDHa/360dhKcgqJqPXGPdxmnpwEa+YCDGgoGPkKY1kuZp7YE7jJac5DzNJlz0OFl
	Fk4Q==
X-Gm-Message-State: AE9vXwM8z3otj1vEQYJhePpGsDyHT4C3aDBfcocxvmPwHXTyeoVMcgEPSt08WwdTDWzeAIDkv4v9sHxRCJ6YB+Xh
X-Received: by 10.194.143.104 with SMTP id sd8mr35451555wjb.161.1473175379744; 
	Tue, 06 Sep 2016 08:22:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.120.162 with HTTP; Tue, 6 Sep 2016 08:22:39 -0700 (PDT)
In-Reply-To: <387803c1b2b8c0f2b3b29b55be61c27b52b4e7f0.1472225461.git.joshua.g.lock@intel.com>
References: <cover.1472225461.git.joshua.g.lock@intel.com>
	<387803c1b2b8c0f2b3b29b55be61c27b52b4e7f0.1472225461.git.joshua.g.lock@intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 6 Sep 2016 17:22:39 +0200
Message-ID: <CAP71WjwZ8Py3To_t+oEVuKNXEagshT2HBiZLL_FtgtCbgD9zBA@mail.gmail.com>
To: Joshua Lock <joshua.g.lock@intel.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] oe.path: preserve xattr in copytree() and copyhardlinktree()
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
X-List-Received-Date: Tue, 06 Sep 2016 15:23:00 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 26, 2016 at 5:43 PM, Joshua Lock <joshua.g.lock@intel.com> wrote:
>
> diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
> index 3c07df3..631c3b4 100644
> --- a/meta/lib/oe/path.py
> +++ b/meta/lib/oe/path.py
> @@ -65,7 +65,7 @@ def copytree(src, dst):
>      # This way we also preserve hardlinks between files in the tree.
>
>      bb.utils.mkdirhier(dst)
> -    cmd = 'tar -cf - -C %s -p . | tar -xf - -C %s' % (src, dst)
> +    cmd = "tar --xattrs --xattrs-include='*' -cf - -C %s -p . | tar --xattrs --xattrs-include='*' -xf - -C %s" % (src, dst)
>      subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>
>  def copyhardlinktree(src, dst):
> @@ -77,9 +77,14 @@ def copyhardlinktree(src, dst):
>      if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
>          # Need to copy directories only with tar first since cp will error if two
>          # writers try and create a directory at the same time
> -        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p --no-recursion --files-from - | tar -xf - -C %s' % (src, src, dst)
> +        cmd = "cd %s; find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -C %s -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*' -xf - -C %s" % (src, src, dst)
>          subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
> -        cmd = 'cd %s; find . -print0 | cpio --null -pdlu %s' % (src, dst)
> +        if os.path.isdir(src):
> +            import glob
> +            if len(glob.glob('%s/.??*' % src)) > 0:
> +                src = src + '/.??* '
> +            src = src + '/*'
> +        cmd = 'cp -afl --preserve=xattr %s %s' % (src, dst)
>          subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>      else:
>          copytree(src, dst)


Now that this got merged, I am seeing the following error:

==
Exception: subprocess.CalledProcessError: Command 'cp -afl
--preserve=xattr
/home/nicolas.dechesne/work/oe-rpb-master/build-rpb/tmp-rpb-glibc/work/x86_64-linux/quilt-native/0.64-r0/license-destdir/*
/home/nicolas.dechesne/work/oe-rpb-master/build-rpb/tmp-rpb-glibc/deploy/licenses'
returned non-zero exit status 1

Subprocess output:
cp: cannot preserve extended attributes, cp is built without xattr support
==

What happens is that I am installing coreutils in my images, and i
have a copy of 'cp' in my sysroot *and* I don't have xattrs in
DISTRO_FEATURES. As a consequence the 'cp' command which is invoked
does not have xattrs support, while my host 'cp' command has it...

e.g.

~/work/oe-rpb-master/build-rpb$
tmp-rpb-glibc/sysroots/x86_64-linux/usr/bin/cp -afl --preserve=xattr
foo bar
tmp-rpb-glibc/sysroots/x86_64-linux/usr/bin/cp: cannot preserve
extended attributes, cp is built without xattr support

while this one works fine:

~/work/oe-rpb-master/build-rpb$ cp -afl --preserve=xattr foo bar

Should we revert these patches or am I missing anything?

thanks

