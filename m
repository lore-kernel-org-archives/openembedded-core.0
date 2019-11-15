Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id BCABB7D58A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2019 23:21:53 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z10so12655957wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2019 15:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=vNT8C7GXwOn2byeBXTT+9H6y3Lkdk5TxgMkndtyWMG0=;
	b=aC9WL0twxuNSeldvuApKjb0rNgNqvYMfL8SOp+wxkyuprm1Uyx+v3zhUxW0fCwBlXH
	ZJCSfxcNYi16B6EBpndpKI6nRqaGfLorolYfsG9TWY2dSbWytTd4vi6mEjKqMuVV4FAj
	EQcg3j6mlPqwKbFA+F6lymeh400omidmUnt2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=vNT8C7GXwOn2byeBXTT+9H6y3Lkdk5TxgMkndtyWMG0=;
	b=sku7+sF0qJSoA5UIWlaWL9bVkZlKy4FBpY7tIKlRtokBSDyN7aOcy18wtWU33leJvG
	jQlyuZOPRaJhB2aGE74+c7F2gfN/PI0S66RNtr20Y6mD6qteSQ/VJWUYwixjiRaQYH4P
	0WPwEg9gw8sOEy9GKlVAkAeIsa9NBsWXHLSv0RInHyHApJqTmenW0QkEp53d7XXZNPgu
	zSTg2pzTPhVDkdZ+Rs6jr5C4feGeeIhokgD06Ny3xT6KgzOrmUpkYGMWVI5imH+RBoZK
	dKaOp1cHzS7U3KXDqMk9/0Zi5ArduwSngszsBdwBiNDnYFWnEr3VXSInCvZw4kOP3Qua
	Ubkg==
X-Gm-Message-State: APjAAAXzoo43QFXSB+JrRFVEIepP4U6IXC/6jbnBjGyWEzsS/J1pY7AY
	pRu/M11Ij4pzoaMQmFyyGOmVRQ==
X-Google-Smtp-Source: APXvYqyz74SielFGhdBN9clURNZIUaFVXJX70Ne88SMmE8EQ+X5PAKEg/WUxfyk1LxaQtta5MUDHEg==
X-Received: by 2002:a5d:4201:: with SMTP id n1mr16983407wrq.372.1573860114380; 
	Fri, 15 Nov 2019 15:21:54 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g184sm12155202wma.8.2019.11.15.15.21.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 15 Nov 2019 15:21:53 -0800 (PST)
Message-ID: <7c584d68f06bb9cd7ebea783e2277abc554c2f37.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Junling Zheng <zhengjunling@huawei.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2019 23:21:50 +0000
In-Reply-To: <20191115104527.22527-1-zhengjunling@huawei.com>
References: <20191115104527.22527-1-zhengjunling@huawei.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: wangnan0@huawei.com
Subject: Re: [PATCH RESEND] staging.bbclass: Fix wrong library path in sysroot_strip
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
X-List-Received-Date: Fri, 15 Nov 2019 23:21:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-11-15 at 18:45 +0800, Junling Zheng wrote:
> Do not reset libdir and base_libdir in sysroot_strip, and just pass
> crude
> paths as they will be reset later in strip_execs.
> 
> Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
> ---
>  meta/classes/staging.bbclass | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
> index cca0b7e0d6..58d57a4323 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -75,8 +75,6 @@ python sysroot_strip () {
>  
>      dstdir = d.getVar('SYSROOT_DESTDIR')
>      pn = d.getVar('PN')
> -    libdir = os.path.abspath(dstdir + os.sep + d.getVar("libdir"))
> -    base_libdir = os.path.abspath(dstdir + os.sep + d.getVar("base_libdir"))
>      qa_already_stripped = 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn) or "").split()
>      strip_cmd = d.getVar("STRIP")

To show this function in full:

python sysroot_strip () {
    inhibit_sysroot = d.getVar('INHIBIT_SYSROOT_STRIP')
    if inhibit_sysroot and oe.types.boolean(inhibit_sysroot):
        return

    dstdir = d.getVar('SYSROOT_DESTDIR')
    pn = d.getVar('PN')
    libdir = os.path.abspath(dstdir + os.sep + d.getVar("libdir"))
    base_libdir = os.path.abspath(dstdir + os.sep + d.getVar("base_libdir"))
    qa_already_stripped = 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn) or "").split()
    strip_cmd = d.getVar("STRIP")

    oe.package.strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, d,
                           qa_already_stripped=qa_already_stripped)
}

so if we apply this patch, we just have two undefined variables which
we pass into oe.package.strip_execs() which would cause a undefined
variable failure?

I think I do see a potential problem as dstdir is added here and then
again strip_execs() itself which does:

def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, d, qa_already_stripped=False):

    libdir = os.path.abspath(dstdir + os.sep + libdir)
    base_libdir = os.path.abspath(dstdir + os.sep + base_libdir)

but the patch as submitted doesn't solve this.

Cheers,

Richard


