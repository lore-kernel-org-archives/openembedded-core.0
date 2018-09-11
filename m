Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A8C3B79699
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 15:18:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8BFI3O6018309
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Sep 2018 08:18:03 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 11 Sep 2018 08:18:02 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1536656353-30689-1-git-send-email-hongxu.jia@windriver.com>
	<CANNYZj8SRYoj3QXZ7_bCLe6qrJq1TBq-WOsHMOLVLpveh151bA@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <41457254-4083-3d7c-4e93-95b320fe7dbb@windriver.com>
Date: Tue, 11 Sep 2018 23:18:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj8SRYoj3QXZ7_bCLe6qrJq1TBq-WOsHMOLVLpveh151bA@mail.gmail.com>
Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: build support openssl 1.1
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
X-List-Received-Date: Tue, 11 Sep 2018 15:18:05 -0000
Content-Type: multipart/alternative;
	boundary="------------64209FE851525D1D11B27A76"
Content-Language: en-US

--------------64209FE851525D1D11B27A76
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018年09月11日 18:39, Alexander Kanavin wrote:
> I'm afraid I have changed my mind, and I have to say no to this. It is
> *not*  a backport, it is a very large patch that nobody understands, it
> will need to be rebased every time there is new openssh out, we cannot
> rely on Fedora doing this, as they apply this patch on top of their
> other patches. Meanwhile, upstream pull request has been stalled for a
> very long time and just isn't going anywhere.
>
> I would suggest you make openssh depend on libressl and find out why
> it is working everywhere except arm64 - that's the only reason we
> haven't done it yet.

Use openssh depends on libressl could not fix the issue, which also 
conflicts
with openssl in the meta-selinux example (they provides the same 
headers/libraries)

The root cause is since rename libssl (1.0) -> libssl10, and drop 
PRFERRED_VERSION,
there are multiple recipes provide ssl (openssl, openssl10, libressl) 
with different name

BTW, even though openssh depends `openssl10',  the `openssl' is installed
to rootfs. It breaks DEPEND/RDEPENDS principle

[local.conf]
IMAGE_INSTALL_append = " openssh"
[local.conf]

$ bitbake core-image-minimal

[log.do_rootfs]
   Installing       : openssl-1.1.1~pre9-r0.core2_64
[log.do_rootfs]

The recipe depends on openssl10, but openssl10 will not be installed.

Here are my suggestions

1: Replace dependence openssl10  -> openssl, such as this fix, and drop 
recipe openssl10 finally;
     1 (openssh) in oe-core, 3 (umip, ipsec-tools, mailx) in oe, 3 
(openssl-tpm-engine,
     tpm-tools, trousers) in meta-secure-core

Or 2: Unify openssl,openssl10 and libressl to provide one ssl,
         we could add PROVIDER = 'virtual/ssl' to above recipe, any recipe
         depends on `openssl' will be replced with `virtual/ssl', the recipe
        depends on `openssl10' will not be changed.

        Set PREFERRED_PROVIDER_virtual//ssl = "openssl | openssl10 | 
libressl" in conf

Or 3: Revert previously patch, rename recipe openssl10 -> openssl 1.0, 
and set
       PREFERRED_VERSION


//Hongxu

>
> Alex



--------------64209FE851525D1D11B27A76
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2018年09月11日 18:39, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj8SRYoj3QXZ7_bCLe6qrJq1TBq-WOsHMOLVLpveh151bA@mail.gmail.com">
      <pre wrap="">I'm afraid I have changed my mind, and I have to say no to this. It is
<b class="moz-txt-star"><span class="moz-txt-tag">*</span>not<span class="moz-txt-tag">*</span></b> a backport, it is a very large patch that nobody understands, it
will need to be rebased every time there is new openssh out, we cannot
rely on Fedora doing this, as they apply this patch on top of their
other patches. Meanwhile, upstream pull request has been stalled for a
very long time and just isn't going anywhere.

I would suggest you make openssh depend on libressl and find out why
it is working everywhere except arm64 - that's the only reason we
haven't done it yet.</pre>
    </blockquote>
    <br>
    Use openssh depends on libressl could not fix the issue, which also
    conflicts<br>
    with openssl in the meta-selinux example (they provides the same
    headers/libraries)<br>
    <br>
    The root cause is since rename libssl (1.0) -&gt; libssl10, and drop
    PRFERRED_VERSION,<br>
    there are multiple recipes provide ssl (openssl, openssl10,
    libressl) with different name<br>
    <br>
    BTW, even though openssh depends `openssl10',  the `openssl' is
    installed<br>
    to rootfs. It breaks DEPEND/RDEPENDS principle<br>
    <br>
    [local.conf]<br>
    IMAGE_INSTALL_append = " openssh"<br>
    [local.conf]<br>
    <br>
    $ bitbake core-image-minimal<br>
    <br>
    [log.do_rootfs]<br>
      Installing       : openssl-1.1.1~pre9-r0.core2_64<br>
    [log.do_rootfs]<br>
    <br>
    The recipe depends on openssl10, but openssl10 will not be
    installed.<br>
    <br>
    Here are my suggestions <br>
    <br>
    1: Replace dependence openssl10  -&gt; openssl, such as this fix,
    and drop recipe openssl10 finally;<br>
        1 (openssh) in oe-core, 3 (umip, ipsec-tools, mailx) in oe, 3
    (openssl-tpm-engine,<br>
        tpm-tools, trousers) in meta-secure-core<br>
    <br>
    Or 2: Unify openssl,openssl10 and libressl to provide one ssl,<br>
            we could add PROVIDER = 'virtual/ssl' to above recipe, any
    recipe<br>
            depends on `openssl' will be replced with `virtual/ssl', the
    recipe<br>
           depends on `openssl10' will not be changed.<br>
    <br>
           Set PREFERRED_PROVIDER_virtual//ssl = "openssl | openssl10 |
    libressl" in conf<br>
    <br>
    Or 3: Revert previously patch, rename recipe openssl10 -&gt; openssl
    1.0, and set<br>
          PREFERRED_VERSION<br>
    <br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote type="cite"
cite="mid:CANNYZj8SRYoj3QXZ7_bCLe6qrJq1TBq-WOsHMOLVLpveh151bA@mail.gmail.com">
      <pre wrap="">

Alex</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------64209FE851525D1D11B27A76--
