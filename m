Return-Path: <net147@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 199AA60111
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 00:34:30 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id e65so148369677pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 16:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=lElhcToaSxSrPBVhRktYAxfjMoNrze6J6uoSRsi8IGM=;
	b=DgK7Sbb/VoUqDtGLrAfWkFnNjgiq8UfScjLq254DcHBzoQKqojz33mkiyUt1iWqFu5
	hzrjamtxACmPbR99sWqLs5lvi9EhW81CfSPwx6K5K3hHYpvnxq7xYr3qej7MkbGiBylW
	99l83CPhvW6dpUrvKPpEE0LDaG8TUSceZRgjLvaUz9rWj3lEu7hk5zV+BI0lcIKfh2a0
	k6mO3C23vLJHTNtyWVExBW8InOnxc7bkfrOWHcYPqIUP4q8F/DG/KYO8bCjfANrFnE1L
	xfzJ1yr6VZnIv1IGrkFIMoAlaGNTW1tdGFbORB0yl6KBEsb+lVTAsRPY2XYjw8ncWo+5
	SM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=lElhcToaSxSrPBVhRktYAxfjMoNrze6J6uoSRsi8IGM=;
	b=U2HGE5O3iVd5DqL0IajFZ/ZIJVyHuPgxrioYbbXBzQByEKFHKyJHESHMVwIv8siGDq
	yjgw/8uQIfwZ4VXdCYrtfD1GCKkUrK1BwRq9eblEW2JQ8qqPOr7C6WqmTkmdu6VhvsUN
	1Lw/vlgBmTMRWk0Mn7sjwhq9YF94Sdve0cmivkZ4yM+58s0cNdE6VZ02ZIPH25TJydol
	hA+Np3NuN/zxgSaI+QNaGfuf7KyHjWYsgXVe/sqSKafEDA5ABo7/TEOa4hsJVtcFhuKB
	Y0GmnmQArzwAQ+3OWcubR4DPcTi1u1rLBc5bBAVnDzXiY4qyXdOD4NJa8/PAgtPBIwKo
	oMBQ==
X-Gm-Message-State: ALoCoQm5QTFLuheXGSdidezQc+v63lJC98fLBNEbgGpFLr6IdmMalNU32OeOKiaOSZmAYeZILdihgVZjW4MGTlgrkCeLOU/oXg==
MIME-Version: 1.0
X-Received: by 10.98.68.211 with SMTP id m80mr32712712pfi.117.1453077271497;
	Sun, 17 Jan 2016 16:34:31 -0800 (PST)
Received: by 10.66.74.38 with HTTP; Sun, 17 Jan 2016 16:34:31 -0800 (PST)
In-Reply-To: <1453069520.27999.28.camel@linuxfoundation.org>
References: <1453069520.27999.28.camel@linuxfoundation.org>
Date: Mon, 18 Jan 2016 11:34:31 +1100
Message-ID: <CANwerB2TC_MnL7EkVH3UU-N0GtuSv3gNVDk3DQQ2XP6ONGzPig@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image: Handle image types containing '-' correctly
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
X-List-Received-Date: Mon, 18 Jan 2016 00:34:32 -0000
Content-Type: text/plain; charset=UTF-8

Hi Richard,

On 18 January 2016 at 09:25, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Shell function names can't contain '-' characters, which means our image
> task names also can't. Add some mapping to use '_' instead of the '-' so
> images like "rpi-sdimg" work again.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 58b75da..e81edb2 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -393,6 +393,12 @@ python () {
>          else:
>              subimages.append(realt)
>
> +        after = 'do_image'
> +        for dep in typedeps[t]:
> +            after += ' do_image_%s' % dep.replace("-", "_")
> +
> +        t = t.replace("-", "_")
> +
>          d.setVar('do_image_%s' % t, '\n'.join(cmds))
>          d.setVarFlag('do_image_%s' % t, 'func', '1')
>          d.setVarFlag('do_image_%s' % t, 'fakeroot', '1')
> @@ -402,10 +408,6 @@ python () {
>          d.appendVarFlag('do_image_%s' % t, 'vardeps', ' '.join(vardeps))
>          d.appendVarFlag('do_image_%s' % t, 'vardepsexclude', 'DATETIME')
>
> -        after = 'do_image'
> -        for dep in typedeps[t]:
> -            after += ' do_image_%s' % dep
> -
>          bb.debug(2, "Adding type %s before %s, after %s" % (t, 'do_image_complete', after))
>          bb.build.addtask('do_image_%s' % t, 'do_image_complete', after, d)
>  }
>
>

This fixes building Raspberry Pi 2 SD images for me. I have the tested
patch and it is working.

Signed-off-by: Jonathan Liu <net147@gmail.com>

Regards,
Jonathan

