Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 09F6D65D59
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 14:52:23 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id a108so5996548qge.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 07:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NisTVbsTsenBWiN9p5YE7cCNVYi4+GELO5TyMKR9MMs=;
	b=VrdjAsO3WpCoQ08KABWaZ/jw9xsbMpa2WHZrwbQ9ZvA12y2Er2EsKGHS1KOVwIKXHD
	1dbr0edWh7zBaYRnhCp9P3YuZt6YRvYkVYTzHNHT8zVkApK26aPYLqaddd9AvMSHYCZR
	5aOQIW7lcOgLbrsaT81icejBxweaizCcotwc6lsk5Wajez5/aj15itL7BgRlt94E0TXy
	NGMgHilBipIQwApFXOhlKEN8pCIU1mLyGmTYNiA/00cwuVmEVN8vnHB4VAcLPJo9IvRs
	ax+Kl8SupzkSaRJUu3A9YT+/BCHUw0lfWXSZAcjrXNl/c0zsH1Y1u18HhOuoj04f9uHw
	/gvQ==
X-Gm-Message-State: ALoCoQldqhIPEaZ2J3tt9HJo3oPfA+H9+Q2gWZ6eAzzf7/WFjRXj8ntmCB5rIYCLxnk4lLsan42x
X-Received: by 10.140.94.144 with SMTP id g16mr9646953qge.77.1411570343167;
	Wed, 24 Sep 2014 07:52:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Wed, 24 Sep 2014 07:52:02 -0700 (PDT)
In-Reply-To: <1ae0b3a4ea4c5fff1bd7a785b3d05d2ac6a0e394.1411558039.git.hongxu.jia@windriver.com>
References: <cover.1411558039.git.hongxu.jia@windriver.com>
	<1ae0b3a4ea4c5fff1bd7a785b3d05d2ac6a0e394.1411558039.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Sep 2014 15:52:02 +0100
Message-ID: <CAJTo0LaVEuz9H=0bYy11myRee806eohDE5uqOyVUcTfTe1yYag@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] scripts/postinst-intercepts: add update_info_dir
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
X-List-Received-Date: Wed, 24 Sep 2014 14:52:28 -0000
Content-Type: text/plain; charset=UTF-8

On 24 September 2014 12:38, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> +# since user's environment is taken over into root account when sudo-ing
> +# we don't want that one's user LANGUAGE setting changes the messages in
> +# the dir file. Unset LANGUAGE and reload /etc/environment to get
> +# the system wide settings. See bug #536476
> +unset LANGUAGE
> +unset LANG
> +if [ -r /etc/environment ] ; then
> +  . /etc/environment
> +fi
> +if [ -r /etc/default/locale ] ; then
> +  . /etc/default/locale
> +fi

Isn't this Debian-specific, and also pushing the build host's
environment settings onto the target?  We should use whatever default
locale is configured for the image, or easier just force it to C.

Ross

