Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D6E671996
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 09:03:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9E931lS026239
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 14 Oct 2016 02:03:01 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 14 Oct 2016 02:03:01 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20161012023734.11991-1-kai.kang@windriver.com>
	<CAJTo0LbhDO+ijOerKVao+s+fruJK98VqQTeMSzxir3_eYWLMbw@mail.gmail.com>
	<57FF9CD8.9040305@windriver.com>
	<CAJTo0LaFVw6oUW5jL7kR-B3TWenNwowGRzcG8=5K=CGqPFx+5w@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <58009F43.6070904@windriver.com>
Date: Fri, 14 Oct 2016 17:02:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaFVw6oUW5jL7kR-B3TWenNwowGRzcG8=5K=CGqPFx+5w@mail.gmail.com>
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
X-List-Received-Date: Fri, 14 Oct 2016 09:03:02 -0000
Content-Type: multipart/alternative;
	boundary="------------040604040506040908070104"

--------------040604040506040908070104
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年10月13日 22:59, Burton, Ross wrote:
>
> On 13 October 2016 at 15:40, Kang Kai <Kai.Kang@windriver.com 
> <mailto:Kai.Kang@windriver.com>> wrote:
>
>     gcc checks tsan and lsan support in source file
>     gcc/libsanitizer/configure.tgt, it seems only support x86_64. Then
>     tsan and lsan related packages will be empty for other target.
>     For qemuarm project, add in local.conf:
>
>     IMAGE_INSTALL_append = " libtsan"
>
>
> If libtsan is x86-64 only, why not only add it for x86-64 images?  The 
> package not existing on machines it can't be built for is more obvious 
> than existing but being empty.

The real scenario is for x86-64 kernel with x86 rootfs. We created a 
template to enable gcc sanitize support. It just simple adds sanitize 
related packages to image:

LIBX_DEV ?= ""
LIBX_DEV_x86-64 = "liblsan-dev libtsan-dev"

IMAGE_INSTALL += " \
     gcc-sanitizers \
     libasan-dev \
     libubsan-dev \
     ${LIBX_DEV} \
"

When multilib is enabled, it fails for x86-64 kernel with x86 rootfs 
such as lib32-xxx-image on qemux86-64. Var IMAGE_INSTALL will be expand 
with prefix lib32 but lib32-lsan* and lib32-tsan* are empty then cause 
the failures.

Regards,
Kai

>
> Ross


-- 
Regards,
Neil | Kai Kang


--------------040604040506040908070104
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2016年10月13日 22:59, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LaFVw6oUW5jL7kR-B3TWenNwowGRzcG8=5K=CGqPFx+5w@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 13 October 2016 at 15:40, Kang Kai
            <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Kai.Kang@windriver.com" target="_blank">Kai.Kang@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div bgcolor="#FFFFFF" text="#000000">gcc checks tsan and
                lsan support in source file gcc/libsanitizer/configure.<wbr>tgt,
                it seems only support x86_64. Then tsan and lsan related
                packages will be empty for other target.<br>
                For qemuarm project, add in local.conf:<br>
                <br>
                IMAGE_INSTALL_append = " libtsan"</div>
            </blockquote>
          </div>
          <br>
          If libtsan is x86-64 only, why not only add it for x86-64
          images?  The package not existing on machines it can't be
          built for is more obvious than existing but being empty.</div>
      </div>
    </blockquote>
    <br>
    The real scenario is for x86-64 kernel with x86 rootfs. We created a
    template to enable gcc sanitize support. It just simple adds
    sanitize related packages to image:<br>
    <br>
    LIBX_DEV ?=
    ""                                                                                               
    <br>
    LIBX_DEV_x86-64 = "liblsan-dev libtsan-dev"<br>
    <br>
    IMAGE_INSTALL += " \<br>
        gcc-sanitizers \<br>
        libasan-dev \<br>
        libubsan-dev \<br>
        ${LIBX_DEV} \<br>
    "<br>
    <br>
    When multilib is enabled, it fails for x86-64 kernel with x86 rootfs
    such as lib32-xxx-image on qemux86-64. Var IMAGE_INSTALL will be
    expand with prefix lib32 but lib32-lsan* and lib32-tsan* are empty
    then cause the failures.<br>
    <br>
    Regards,<br>
    Kai<br>
    <br>
    <blockquote
cite="mid:CAJTo0LaFVw6oUW5jL7kR-B3TWenNwowGRzcG8=5K=CGqPFx+5w@mail.gmail.com"
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

--------------040604040506040908070104--
