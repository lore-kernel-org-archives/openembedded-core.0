Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f43.google.com (mail-pl0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1590B606A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 01:40:03 +0000 (UTC)
Received: by mail-pl0-f43.google.com with SMTP id b12so7521173plm.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 17:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G+7ziWbEfOe4tKqwRu7gJ/JVZ05heT5oq+cPsHN4Rpw=;
	b=TW2u++SQCD9NMKEmxag/fGHobMDsolxOjr9OZZ7ikWgGRMeMjn7raPmVZNgFVcG4rL
	0dxSxAxDsxcRwJRZGZBalxVMOST7/57+/8F7+7YDI0OBHKy9WAa6yQjjSQOAwknoH2ws
	XjVJURFXVmtL99bwK57QzE9eX/bY11wLIXS/cIa7JFVPJaDPAr2r7oyGE8bwOdpyLfQH
	SUcQ8TkmiA9Lq4lxq46q+lpBXiLtoyGElvhUORUI8OjHKOLxalhGc51pi56PYDAzB8DZ
	S7pfyN20bwvAjTtM3iiuo+Ro/Eta8n8zF+IQK5K71BGcPKUeYe4VzjRHcsUI35CRJn+w
	SiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G+7ziWbEfOe4tKqwRu7gJ/JVZ05heT5oq+cPsHN4Rpw=;
	b=ljXat4nvCNNJtsVxy1FfDbnHeYGYlP+LGiQ+pWzcK4wxs/dHKEEUKJFbO91wZVdX3O
	eIidKOyCSKhkf+AqPCOQwPjtSsHtd1Rqw74QZNgxm8+AcwLaRzHuiYQPgk3k0q7MEu/+
	mavuO19ETonIl1PsAR3HU4vOj9jP3jceJPxVV0bTSy5AYE07ndw4wMb3U5sHw64g/6uT
	VA8c1EDnQAyGLafPOMPV6z1Lg+1tXc1hrY33WfcfzCGp/rTZizap89rKnGzqZaJKk5cS
	1ogR+knXLeNRdw1Rx2zxAY2BfLvG+tXvP/N8cBp8Z8Fsl+dHqeg39X5UWeW2H8HTJMyp
	fxjQ==
X-Gm-Message-State: AJaThX5hVQQpxYy1c6Tu9GGeO42d6cmEnFmGcSVal/MH+49y7kI3Ll0+
	A0TN4QmGAD0T7cFTtfiWuHZcunc2WDfoBqdh9uA=
X-Google-Smtp-Source: AGs4zMZP408hIDwawA00M2NTYqhh+mwz1PosyCxTPMLxYsYaRVqlu9ykDyuIs1d4OoRwmM3ZJEYYJ3lQDwLhPn17eKU=
X-Received: by 10.84.213.144 with SMTP id g16mr36647128pli.339.1511746805300; 
	Sun, 26 Nov 2017 17:40:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Sun, 26 Nov 2017 17:39:34 -0800 (PST)
In-Reply-To: <1511525431.5979.64.camel@intel.com>
References: <1511525431.5979.64.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Nov 2017 17:39:34 -0800
Message-ID: <CAMKF1spc06O7kq2kDbWXKZXxh0ErQvpdh6=+jObCKinpjT5=OA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: read-only rootfs + boot parameters
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
X-List-Received-Date: Mon, 27 Nov 2017 01:40:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 24, 2017 at 4:10 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> Hello!
>
> I noticed that APPEND is left unchanged when adding "read-only-rootfs"
> to IMAGE_FEATURES. The effect is (at least in refkit, which uses an
> initramfs based on initramfs-framework) that the rootfs initially gets
> mounted read/write and then gets remounted by systemd as read-only -
> but only after writing to /etc/machine-id.
>
> Is that the desired behavior or an oversight?
>

seems an oversight to me

> To me, read-only means read-only, with no exceptions. The obvious fix
> is:
> APPEND_append = "${@ bb.utils.contains('IMAGE_FEATURES', 'read-only-rootfs', ' ro', '', d)} "
>
> I'm just not sure whether that should go into image.bbclass or
> elsewhere.
>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

