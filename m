Received: from mail-vb0-f49.google.com ([209.85.212.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UQfc1-0006U7-5s
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 17:10:02 +0200
Received: by mail-vb0-f49.google.com with SMTP id 11so2180398vbf.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 07:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=q1/0VAxdRhX3MnYelbJNKoW+ZLOsc1crEBjvoe5YOXQ=;
	b=gQbYLjfuTnz52UFmQaLTJEcsCl549CaQjAeGZ0ZJ6Ud+i9CBPB3V7OXRGH0N/xaVeD
	E5J7pEcEaOc+JEzJbhjhxUigsz/b4Y5f0vPHeIY/9JSTbWk1DQ/t17Jq8CK1e2cnKMH6
	ARYNxthcHmpapaQhArNevPlUSWGqCiqd6rCixjb8ERTuGJcKE878BpbckM1E8ClDlElk
	ln6WbacayB/EJvzIxdTS9qR1jVbc+sVhwxF/wrSwt9emE8CduHsErioTu2PuAEIB+ptE
	fXsIZYHf8h5qz5IY5UeHgjVswqZj/U7IefAEok7H14dz6ndUSkcTaBXwq4hO+hT/q9Xs
	zNXQ==
X-Received: by 10.220.140.18 with SMTP id g18mr8725996vcu.54.1365778356232;
	Fri, 12 Apr 2013 07:52:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Fri, 12 Apr 2013 07:52:16 -0700 (PDT)
In-Reply-To: <20130412144335.GR2477@jama>
References: <20130412142015.GP2477@jama>
	<CAJTo0LayWKMpxzsX4t67LepAg3AjhJXWtQvoU8-NVG5Qi5eTpA@mail.gmail.com>
	<20130412144335.GR2477@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Apr 2013 15:52:16 +0100
Message-ID: <CAJTo0Lbirs+atokCCyL8d5QGgNVCTS1Wb+Dj2BRi2etq0A0TSA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQk0x1rbvGGCSlZjpKV7d2wNNYs53BErbk+5xNToHGVSHacREg4Vk0u+N79QY/yz0irtZ2Kc
Cc: openembedded-core@lists.openembedded.org
Subject: Re: wpa-supplicant postinsts failing without sysvinit in DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Apr 2013 15:10:03 -0000
Content-Type: text/plain; charset=UTF-8

On 12 April 2013 15:43, Martin Jansa <martin.jansa@gmail.com> wrote:
> I have noticed this when testing upgrade paths, but general-purpose
> abstraction will became quite complicated in images which have both
> sysvinit and systemd scripts (I guess that checking which init is
> running will be needed to decide if /etc/init.d/foo or systemctl should be
> called :/).

Something along the lines of

  if which systemctl && test -d /run/systemd/system

should do the job.  Checking that directory exists is how
libsystemd-daemon determines if systemd is active or not, so if it's
good enough for them it's good enough for us.

Ross


