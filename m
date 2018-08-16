Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7F84D79268
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 21:44:20 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o11-v6so5725784wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 14:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=figQYb7/do9qW9uvhzcWRXD7tOQBPNHGeWfeONTi0sM=;
	b=ZfHpk4Y+TDhyGnQ1YX+cEsUies4aOvo7jc7e8HohBVPbxmBNdIEUNTz/U4gQlA5rkd
	4OBBmZqHGYr5Ul0KvnTLSdwC2+vwYkopXdDKhAtWhrgmHsrrmy5YelsRBy6tCfp/t4+b
	pOyY5I4o+BUI5ZTboGiD+Zz9/LCbcW0XHFSHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=figQYb7/do9qW9uvhzcWRXD7tOQBPNHGeWfeONTi0sM=;
	b=FfX0E4oSmmZSnJQEqLamRB8cSCfahSB99CXgbAzo2EZp62TaNM5BA+bTDy3ARglGoj
	IMaOCqCHHb5q+XIvKRpa0GiYq09T4wWywgmOhSZSowmo8GsfBD7cUSQhu0lCNCcYYYd0
	85Qwd15LryVd82J0UVqr4VehNVAL6C7a0unKwcdtqGasdE/Vmin2PU6jI5fsAbveaGT4
	QycbKYk5Cyn+nrwzbK9eckficLojvoFUgnDt2atdXjvFEUpwbT3bknwyEk8j7BIvgrWQ
	i/gzQN86MVQK5iKbOapQzv55saddKfZDP3OcJ58Tatj5NVYGCSSgtiGgq2nirw1z0HDK
	4s8w==
X-Gm-Message-State: AOUpUlGN7m/4WcXg35lFiVaxGgtRf3eea8KnzHFduZFWiEoGVthjDF97
	0G9HoKkZwFO8rMwYFlXd0AO/ZA==
X-Google-Smtp-Source: AA+uWPw6WpYmqPlRoxQ0a5zsE+Tz+RwqGKRJXWIoS6UST0XhVKtPL9zf/cBS9EqoAxp5s+eiY2BBwA==
X-Received: by 2002:a1c:790b:: with SMTP id
	l11-v6mr16438142wme.66.1534455861144; 
	Thu, 16 Aug 2018 14:44:21 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t6-v6sm3201420wmf.8.2018.08.16.14.44.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 14:44:20 -0700 (PDT)
Message-ID: <3927163d00059d0559412175c903ba60ce383dcd.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 16 Aug 2018 22:44:18 +0100
In-Reply-To: <CADkTA4OrPcXQEZ+d1HEeNZBrJy_VcyJcv_7DmhnBddmLQPVYZg@mail.gmail.com>
References: <1534453421-28943-1-git-send-email-bruce.ashfield@windriver.com>
	<CADkTA4OrPcXQEZ+d1HEeNZBrJy_VcyJcv_7DmhnBddmLQPVYZg@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Thu, 16 Aug 2018 21:44:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-08-16 at 17:08 -0400, Bruce Ashfield wrote:
> I'm getting a strange install issue with x86 that I've never seen
> before, and that
> part is unchanged from v3 to v4.
> 
> .. and then I realized that a file has changed in my builds, since
> I'm
> working on 4.18.
> 
> This is worth testing on the autobuilder, but I will have a v5 that
> adds a test for some
> files that may go missing, and hence we'll have issues across
> versions.

Thanks, I've added it into a build with a glibc and openssl change and
set it away so its possible other issues may occur, we'll see how it
works out...

Cheers,

Richard

