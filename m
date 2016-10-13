Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C09696B6EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 14:40:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9DEeQnb016666
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 13 Oct 2016 07:40:26 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 13 Oct 2016 07:40:26 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20161012023734.11991-1-kai.kang@windriver.com>
	<CAJTo0LbhDO+ijOerKVao+s+fruJK98VqQTeMSzxir3_eYWLMbw@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <57FF9CD8.9040305@windriver.com>
Date: Thu, 13 Oct 2016 22:40:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbhDO+ijOerKVao+s+fruJK98VqQTeMSzxir3_eYWLMbw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-sanitizers: allow empty for lsan and tsan packages
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
X-List-Received-Date: Thu, 13 Oct 2016 14:40:27 -0000
Content-Type: multipart/alternative;
	boundary="------------030104080107010707000706"

--------------030104080107010707000706
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年10月12日 17:26, Burton, Ross wrote:
>
> On 12 October 2016 at 03:37, <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     gcc checks threads and leak sanitizers support when do configure.
>     If not
>     supported, packages of tsan and lsan are empty. If add such package to
>     image it fails to build:
>
>     | ERROR: core-image-minimal-1.0-r0 do_rootfs: libtsan-dev not
>     found in the feeds
>     | ERROR: core-image-minimal-1.0-r0 do_rootfs: This is often caused
>     by an empty
>     | package declared in a recipe's PACKAGES variable. (Empty
>     packages are not
>     | constructed unless ALLOW_EMPTY_<pkg> = '1' is used.)
>
>
> Not sure I'm understand where those dependencies are coming from, how 
> would I replicate this?

gcc checks tsan and lsan support in source file 
gcc/libsanitizer/configure.tgt, it seems only support x86_64. Then tsan 
and lsan related packages will be empty for other target.
For qemuarm project, add in local.conf:

IMAGE_INSTALL_append = " libtsan"

Then run 'bitbake core-image-minimal", it shows errors:

ERROR: core-image-minimal-1.0-r0 do_rootfs: libtsan not found in the 
feeds (qemuarm armv5te armv5e armv5t armv5 armv4t armv4 arm noarch any 
all) in /buildarea3/kkang/poky-20141111/builds/qemuarm-Aug05/tmp/deploy/rpm.
ERROR: core-image-minimal-1.0-r0 do_rootfs: This is often caused by an 
empty package declared in a recipe's PACKAGES variable. (Empty packages 
are not constructed unless ALLOW_EMPTY_<pkg> = '1' is used.)
ERROR: core-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs
ERROR: Logfile of failure stored in: 
/buildarea3/kkang/poky-20141111/builds/qemuarm-Aug05/tmp/work/qemuarm-poky-linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_rootfs.24600
ERROR: Task 
(/buildarea3/kkang/poky-20141111/poky/meta/recipes-core/images/core-image-minimal.bb:do_rootfs) 
failed with exit code '1'


Regards,
Kai



>
> Ross


-- 
Regards,
Neil | Kai Kang


--------------030104080107010707000706
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2016年10月12日 17:26, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbhDO+ijOerKVao+s+fruJK98VqQTeMSzxir3_eYWLMbw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 12 October 2016 at 03:37, <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:kai.kang@windriver.com" target="_blank">kai.kang@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":78s" class="a3s aXjCH m157b6cadd316c3fb">gcc
                checks threads and leak sanitizers support when do
                configure. If not<br>
                supported, packages of tsan and lsan are empty. If add
                such package to<br>
                image it fails to build:<br>
                <br>
                | ERROR: core-image-minimal-1.0-r0 do_rootfs:
                libtsan-dev not found in the feeds<br>
                | ERROR: core-image-minimal-1.0-r0 do_rootfs: This is
                often caused by an empty<br>
                | package declared in a recipe's PACKAGES variable.
                (Empty packages are not<br>
                | constructed unless ALLOW_EMPTY_&lt;pkg&gt; = '1' is
                used.)<br>
              </div>
            </blockquote>
          </div>
          <br>
          Not sure I'm understand where those dependencies are coming
          from, how would I replicate this?</div>
      </div>
    </blockquote>
    <br>
    gcc checks tsan and lsan support in source file
    gcc/libsanitizer/configure.tgt, it seems only support x86_64. Then
    tsan and lsan related packages will be empty for other target.<br>
    For qemuarm project, add in local.conf:<br>
    <br>
    IMAGE_INSTALL_append = " libtsan"<br>
    <br>
    Then run 'bitbake core-image-minimal", it shows errors:<br>
    <br>
    ERROR: core-image-minimal-1.0-r0 do_rootfs: libtsan not found in the
    feeds (qemuarm armv5te armv5e armv5t armv5 armv4t armv4 arm noarch
    any all) in
    /buildarea3/kkang/poky-20141111/builds/qemuarm-Aug05/tmp/deploy/rpm.<br>
    ERROR: core-image-minimal-1.0-r0 do_rootfs: This is often caused by
    an empty package declared in a recipe's PACKAGES variable. (Empty
    packages are not constructed unless ALLOW_EMPTY_&lt;pkg&gt; = '1' is
    used.)<br>
    ERROR: core-image-minimal-1.0-r0 do_rootfs: Function failed:
    do_rootfs<br>
    ERROR: Logfile of failure stored in:
/buildarea3/kkang/poky-20141111/builds/qemuarm-Aug05/tmp/work/qemuarm-poky-linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_rootfs.24600<br>
    ERROR: Task
    (/buildarea3/kkang/poky-20141111/poky/meta/recipes-core/images/core-image-minimal.bb:do_rootfs)
    failed with exit code '1'<br>
    <br>
    <br>
    Regards,<br>
    Kai<br>
    <br>
    <br>
    <br>
    <blockquote
cite="mid:CAJTo0LbhDO+ijOerKVao+s+fruJK98VqQTeMSzxir3_eYWLMbw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------030104080107010707000706--
