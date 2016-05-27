Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 113DA6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 10:54:26 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n129so13215621wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 03:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version;
	bh=5CGWhaV3aIqpTx479L6QT5X9uORu0KPupuqC7ThGjgY=;
	b=c8zwDwnk5t3FM7cMvpCsGljkOIo7o0mB+3tI4jsQnXLpMnFmeM4HVuwPqpHt8mjjPy
	CWY5HI+r8bxLrZZ47Eo9O8OV0g+ub8r0MnkgcfI762ZqReGhrCQP2l3mOULKMqrBkW/Z
	e4U+UuwuISEQoaLAl7Vof3YvateyuTYScM5akhmGSR4Esd7dt5QtX/K9iM+IwzovLdLC
	Fk6JMkf4HLm50GyYeb3ajPhd3qKEwXHouS+BBa66/6NdijuNT6lto8pZQ2ao1dx5WrCX
	2jn+H4cqvSLEUnIj8o/bKgc8rRMScpIIsFBK3+FFvUg0rbYLkp1QQ6FnF3av6dRX+E3X
	myoA==
X-Gm-Message-State: ALyK8tKUeMmMPEZvm2hm7h9vkiMOTU559fm6zwGqDwwKAKOoa3+kflPG4fZRnEk7OvVmbg==
X-Received: by 10.195.11.106 with SMTP id eh10mr16139532wjd.130.1464346466144; 
	Fri, 27 May 2016 03:54:26 -0700 (PDT)
Received: from localhost ([185.46.212.59]) by smtp.gmail.com with ESMTPSA id
	lr9sm18752786wjb.39.2016.05.27.03.54.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2016 03:54:24 -0700 (PDT)
Message-ID: <1464346463.28160.45.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 27 May 2016 11:54:23 +0100
In-Reply-To: <1462534000-18539-1-git-send-email-ross.burton@intel.com>
References: <1462534000-18539-1-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.20.2-2 
Mime-Version: 1.0
Subject: Re: [PATCH] bitbake.conf: add default for IMAGE_FSTYPES_DEBUGFS
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
X-List-Received-Date: Fri, 27 May 2016 10:54:27 -0000
X-Groupsio-MsgNum: 82787
Content-Type: multipart/mixed; boundary="=-wEIpr+io8ETYrx2CmCg7"

--=-wEIpr+io8ETYrx2CmCg7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This doesn't work for me (at least on krogoth):

    ERROR: poky/meta/recipes-core/images/build-appliance-image_14.0.0.bb: No IMAGE_CMD defined for IMAGE_FSTYPES entry 'debugfs_vmdk' - possibly invalid type name or missing support class
    ERROR: Failed to parse recipe: poky/meta/recipes-core/images/build-appliance-image_14.0.0.bb

I *instead* am using the attached patch successfully.

Is anybody else facing the same issue?


On Fr, 2016-05-06 at 12:26 +0100, Ross Burton wrote:
> If debug filesystem generation is enabled but this isn't assigned then the
> generation code throws exceptions.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/conf/bitbake.conf | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 1c4175f..8e02e91 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -713,6 +713,7 @@ require conf/sanity.conf
>  DL_DIR ?= "${TOPDIR}/downloads"
>  SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
>  IMAGE_FSTYPES ?= "tar.gz"
> +IMAGE_FSTYPES_DEBUGFS ?= "${IMAGE_FSTYPES}"
>  
>  INITRAMFS_FSTYPES ?= "cpio.gz"
>  # The maximum size in Kbytes for the generated initramfs image size.
> -- 
> 2.8.0.rc3
> 

--=-wEIpr+io8ETYrx2CmCg7
Content-Disposition: attachment; filename="0001-image.bbclass-allow-IMAGE_FSTYPES_DEBUGFS-to-be-unse.patch"
Content-Type: text/x-patch; name="0001-image.bbclass-allow-IMAGE_FSTYPES_DEBUGFS-to-be-unse.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSAwMDFhYjY2YzM2YjE4YjhhM2YyNWIxMTE2YThjNjU4MGM2NzZhNjczIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/QW5kcj1DMz1BOT0yMERyYXN6aWs/PSA8Z2l0
QGFuZHJlZC5uZXQ+CkRhdGU6IFR1ZSwgMTIgQXByIDIwMTYgMDk6MTQ6NDAgKzAxMDAKU3ViamVj
dDogW1BBVENIXSBpbWFnZS5iYmNsYXNzOiBhbGxvdyBJTUFHRV9GU1RZUEVTX0RFQlVHRlMgdG8g
YmUgdW5zZXQgKGFzCiBwZXIgdGhlIGRvY3VtZW50YXRpb24pCgpjb25mL2xvY2FsLmNvbmYuc2Ft
cGxlLmV4dGVuZGVkIGRlc2NyaWJlcyBJTUFHRV9GU1RZUEVTX0RFQlVHRlMgYXMgZGVmYXVsdGlu
Zwp0byBJTUFHRV9GU1RZUEVTIGlmIHVuc2V0LgoKSWYgeW91IGFjdHVhbGx5IGRvIHRoYXQsIGku
ZS4gZW5hYmxlIElNQUdFX0dFTl9ERUJVR0ZTIGJ1dCBkb24ndCBzZXQKSU1BR0VfRlNUWVBFU19E
RUJVR0ZTLCB5b3UgZ2V0IHRoZSBmb2xsb3dpbmcgcGFyc2UgZXJyb3I6CgpFUlJPUjogRXJyb3Ig
ZXhlY3V0aW5nIGEgcHl0aG9uIGZ1bmN0aW9uIGluIDxjb2RlPjoKClRoZSBzdGFjayB0cmFjZSBv
ZiBweXRob24gY2FsbHMgdGhhdCByZXN1bHRlZCBpbiB0aGlzIGV4Y2VwdGlvbi9mYWlsdXJlIHdh
czoKRmlsZTogJzxjb2RlPicsIGxpbmVubzogMTQsIGZ1bmN0aW9uOiA8bW9kdWxlPgogICAgIDAw
MTA6X19hbm9uXzM4X19tZXRhX2NsYXNzZXNfcm9vdGZzX2lwa19iYmNsYXNzKGQpCiAgICAgMDAx
MTpfX2Fub25fMTEzX19tZXRhX2NsYXNzZXNfaW1hZ2VfYmJjbGFzcyhkKQogICAgIDAwMTI6X19h
bm9uXzE3Nl9fbWV0YV9jbGFzc2VzX2ltYWdlX2JiY2xhc3MoZCkKICAgICAwMDEzOl9fYW5vbl8x
NDZfX21ldGFfY2xhc3Nlc19zaXRlaW5mb19iYmNsYXNzKGQpCiAqKiogMDAxNDpfX2Fub25fNDM3
X19tZXRhX2NsYXNzZXNfaW1hZ2VfYmJjbGFzcyhkKQpGaWxlOiAnPHBva3k+bWV0YS9jbGFzc2Vz
L2ltYWdlLmJiY2xhc3MnLCBsaW5lbm86IDMyMiwgZnVuY3Rpb246IF9fYW5vbl80MzdfX21ldGFf
Y2xhc3Nlc19pbWFnZV9iYmNsYXNzCiAgICAgMDMxODogICAgdHlwZWRlcHMgPSB7fQogICAgIDAz
MTk6CiAgICAgMDMyMDogICAgaWYgZC5nZXRWYXIoJ0lNQUdFX0dFTl9ERUJVR0ZTJywgVHJ1ZSkg
PT0gIjEiOgogICAgIDAzMjE6ICAgICAgICBkZWJ1Z2ZzX2ZzdHlwZXMgPSBkLmdldFZhcignSU1B
R0VfRlNUWVBFU19ERUJVR0ZTJywgVHJ1ZSkuc3BsaXQoKQogKioqIDAzMjI6ICAgICAgICBmb3Ig
dCBpbiBkZWJ1Z2ZzX2ZzdHlwZXM6CiAgICAgMDMyMzogICAgICAgICAgICBhbGx0eXBlcy5hcHBl
bmQoImRlYnVnZnNfIiArIHQpCiAgICAgMDMyNDoKICAgICAwMzI1OiAgICBkZWYgX2FkZF90eXBl
KHQpOgogICAgIDAzMjY6ICAgICAgICBiYXNldCA9IF9pbWFnZV9iYXNlX3R5cGUodCkKRXhjZXB0
aW9uOiBBdHRyaWJ1dGVFcnJvcjogJ05vbmVUeXBlJyBvYmplY3QgaGFzIG5vIGF0dHJpYnV0ZSAn
c3BsaXQnCi0tLQogbWV0YS9jbGFzc2VzL2ltYWdlLmJiY2xhc3MgfCA0ICsrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0
YS9jbGFzc2VzL2ltYWdlLmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMvaW1hZ2UuYmJjbGFzcwppbmRl
eCBhY2FhOWVjLi41OWJhMzhlIDEwMDY0NAotLS0gYS9tZXRhL2NsYXNzZXMvaW1hZ2UuYmJjbGFz
cworKysgYi9tZXRhL2NsYXNzZXMvaW1hZ2UuYmJjbGFzcwpAQCAtMzE4LDggKzMxOCw4IEBAIHB5
dGhvbiAoKSB7CiAgICAgdHlwZWRlcHMgPSB7fQogCiAgICAgaWYgZC5nZXRWYXIoJ0lNQUdFX0dF
Tl9ERUJVR0ZTJywgVHJ1ZSkgPT0gIjEiOgotICAgICAgICBkZWJ1Z2ZzX2ZzdHlwZXMgPSBkLmdl
dFZhcignSU1BR0VfRlNUWVBFU19ERUJVR0ZTJywgVHJ1ZSkuc3BsaXQoKQotICAgICAgICBmb3Ig
dCBpbiBkZWJ1Z2ZzX2ZzdHlwZXM6CisgICAgICAgIGRlYnVnZnNfZnN0eXBlcyA9IGQuZ2V0VmFy
KCdJTUFHRV9GU1RZUEVTX0RFQlVHRlMnLCBUcnVlKSBvciAnJworICAgICAgICBmb3IgdCBpbiBk
ZWJ1Z2ZzX2ZzdHlwZXMuc3BsaXQoKToKICAgICAgICAgICAgIGFsbHR5cGVzLmFwcGVuZCgiZGVi
dWdmc18iICsgdCkKIAogICAgIGRlZiBfYWRkX3R5cGUodCk6Ci0tIAoyLjguMQoK

--=-wEIpr+io8ETYrx2CmCg7--
