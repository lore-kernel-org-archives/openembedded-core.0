Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 31C28770C4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 09:40:31 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o80so3001637wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 02:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QkNtIIUJll5EnKVYn4IZ4wwJ6N0D5AKIvV310lbgBYk=;
	b=R7YrpATvv9PSTzpznLZByFzTb4M2mxHUjRLVB86AzlY28h4MkEkwcag96+7pDg086f
	NzzqAKkxFLDVlYYn4ZOIhGI9NW0DJ9WK8ScbzwgTTefevyiKavovn0g5TJqLh9JGNlPH
	YC/C+t+0kLhO4KTF1Y0jTzGqAGLuObz2avOOIzHbfB1RR427/8i2oGSdQCKd+CzoFWWg
	pwemTvYeku/MWd7EnraTbD/lpmoIlxUfjlVN4xII/4R4jHXc7SFTqEygzh1AWeiEqfyY
	oucSr5lTeRK0jeqavxbFSfSlmu+sO9w57dNa83YhkPnQv719PHN+8+SJJqgdSmKj27HU
	E2YA==
X-Gm-Message-State: AEkoouswbaQIYW57kEPXIHbF8jxIM5N793f5sEZ4pUGyy/cPx0FMyQMvc94GOl54Fgl5/g==
X-Received: by 10.194.189.229 with SMTP id gl5mr71709911wjc.168.1470390031512; 
	Fri, 05 Aug 2016 02:40:31 -0700 (PDT)
Received: from localhost ([185.46.212.59]) by smtp.gmail.com with ESMTPSA id
	o4sm16954789wjd.15.2016.08.05.02.40.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 05 Aug 2016 02:40:30 -0700 (PDT)
Message-ID: <1470390033.4581.6.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 05 Aug 2016 10:40:33 +0100
In-Reply-To: <1470389692-9787-1-git-send-email-git@andred.net>
References: <1470389692-9787-1-git-send-email-git@andred.net>
X-Mailer: Evolution 3.20.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH] cml1.bbclass: explicitly set workdir
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
X-List-Received-Date: Fri, 05 Aug 2016 09:40:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Sorry, please ignore this! Didn't realise it's fixed in oe-core just not in
poky.git yet.

On Fri, 2016-08-05 at 10:34 +0100, André Draszik wrote:
> bitbake rev 67a7b8b02 "build: don't use $B as the default cwd for
> functions" (included in current bitbake master) breaks the assumption
> that do_menuconfig / do_diffconfig run inside the build directory.
> 
> This causes these tasks to fail as they're being executed in the
> wrong directory.
> 
> Set workdir explicitly.
> 
> Signed-off-by: André Draszik <git@andred.net>
> ---
>  meta/classes/cml1.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
> index 5834806..4b3b916 100644
> --- a/meta/classes/cml1.bbclass
> +++ b/meta/classes/cml1.bbclass
> @@ -41,6 +41,7 @@ python do_menuconfig() {
>              bb.build.write_taint('do_compile', d)
>  }
>  do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
> +do_menuconfig[dirs] = "${B}"
>  do_menuconfig[nostamp] = "1"
>  do_menuconfig[dirs] = "${B}"
>  addtask menuconfig after do_configure
> @@ -72,7 +73,7 @@ python do_diffconfig() {
>          if os.path.exists(fragment):
>              os.unlink(fragment)
>  }
> -
> +do_diffconfig[dirs] = "${B}"
>  do_diffconfig[nostamp] = "1"
>  do_diffconfig[dirs] = "${B}"
>  addtask diffconfig

