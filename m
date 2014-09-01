Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4E3A0712FC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Sep 2014 15:36:18 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id w8so5048638qac.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Sep 2014 08:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ycQPPp+JTnfOv5XFNB2mtvExKKGfXPAVoDAlynawbps=;
	b=Ul5rUZNcsh1pgyhMfRfpoyOlDpBRrfe+Xo+6coi6IWwpE2tlcmkn06gRfqUlh48OTk
	lpvmwViwGwSUGUPBgiD4GC7xfEIbE7WB6m0RCMPOsPGOVhKfrJiIcRG0SiEoVsked3YP
	54KSlk6fwKmBSOWI971Bq/daDTCbX0fYp8YCFj+jIY0D59/pFz37veZztwkwAGLETFg/
	CJN78W35BIS79EJEpquFND6QaC6veVg6mlWf/GakFQsAZkCBc5Resllf0EWk0ZoXRdyn
	YV6ZuT+CTV/Y+agv2LPmhaLMMDoFVWdqmu49BfZ2jR26zt4vrvx+w+ciMokMgiDwQY2A
	RqSQ==
X-Gm-Message-State: ALoCoQnT04GpqgbxuowWd38e0xB4/Ksz9Vx0P9JqY9AyS/QOvgjjo3o9vbHYBlw35C5gO6lEYQsb
X-Received: by 10.140.105.138 with SMTP id c10mr43884915qgf.15.1409585779620; 
	Mon, 01 Sep 2014 08:36:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Mon, 1 Sep 2014 08:35:59 -0700 (PDT)
In-Reply-To: <1406969694.6981.22.camel@ted>
References: <1406969694.6981.22.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Sep 2014 16:35:59 +0100
Message-ID: <CAJTo0LYwVKgvz9rPp8++USbeN0Acow9a5jfyrYFWZ-3EGTF1ew@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC] pixbufcache: Use sceneQueueComplete event to simplify usage
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
X-List-Received-Date: Mon, 01 Sep 2014 15:36:21 -0000
Content-Type: text/plain; charset=UTF-8

On 2 August 2014 09:54, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -324,6 +326,15 @@ python base_eventhandler() {
>              e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++")
>              e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs")
>
> +    if isinstance(e, bb.runqueue.sceneQueueComplete):
> +        pbfile = e.data.expand("${STAGING_DIR}/needpixbuf")
> +        if os.path.exists(pbfile):
> +            bb.build.exec_func("gdkpixbuf_complete", e.data)
> +            os.remove(pbfile)

I'm really not keen on base.bbclass having gdk-pixbuf specific
knowledge - the problem isn't specific to gdk-pixbuf, it's just
obvious there.

Ross

