Received: from mail-oa0-f42.google.com ([209.85.219.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <erik.boto@pelagicore.com>) id 1UMzBk-0007ab-Ce
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 13:15:40 +0200
Received: by mail-oa0-f42.google.com with SMTP id i18so251910oag.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2013 03:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:x-gm-message-state;
	bh=uYffP+ctsl7QCca9QCb/2DRzouFtWCKmn5VAFKN+iLs=;
	b=nFC/jReD+IRrc0Mr1ObnrWHs1BIxW1tqyzTpoBIzYQhLel89qaXlobF8qdghEOF0L/
	f9qhIZiseORMVtKyU/Qlnrx8Td1gjnAjYNz5A1u7YPqJbANmlTSFklgU/OjijK7faA6T
	dYLcAxqaRQJ6PRfE0OeCssa8Ju08deMT19eLlQT42Jli/UsrkI/oKY+5Kz8DHRyZ8npO
	Dnz7QoNpzJR9a2P1A7h3P3cvQ2yis2VZMkpPJPj/7IeQI4SmOYYo4PtTgFoEAmILsGh9
	E9sLNYeHDjvUlsmv2d8GrGo53R3pWTPtbx245F9dx5TIAtE5od2+2ctmw/2kyXtdbFEl
	BWWw==
MIME-Version: 1.0
X-Received: by 10.60.118.104 with SMTP id kl8mr5390703oeb.68.1364900310177;
	Tue, 02 Apr 2013 03:58:30 -0700 (PDT)
Received: by 10.76.21.173 with HTTP; Tue, 2 Apr 2013 03:58:30 -0700 (PDT)
In-Reply-To: <ddbbb594a0a4c3ff64bb5e4ce0be895a5e2f0193.1364456659.git.raj.khem@gmail.com>
References: <cover.1364456659.git.raj.khem@gmail.com>
	<ddbbb594a0a4c3ff64bb5e4ce0be895a5e2f0193.1364456659.git.raj.khem@gmail.com>
Date: Tue, 2 Apr 2013 12:58:30 +0200
Message-ID: <CA+AhUGyzFN2PTZUg5BESHKYdMi7gsj0V2bdJAGCd0rg9147NTQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
To: Khem Raj <raj.khem@gmail.com>
X-Gm-Message-State: ALoCoQkjSDYWWmXndRyVeIS4Q7Fwjnba8lauFZIoVvovETvbTLHFAlDzOQcs6Q2AvUhM2SefOHKC
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: Upgrade to 199
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
X-List-Received-Date: Tue, 02 Apr 2013 11:15:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

On Thu, Mar 28, 2013 at 8:48 AM, Khem Raj <raj.khem@gmail.com> wrote:
> udevadm is now moved from /usr/bin to /bin so account for that
> bash completions for udevadm should be packages with udev-utils
> since thats where udevadm itself is, they were in systemd package
> which is not correct location for it

It looks like systemd-analyze installs into /usr/bin and therefore
isn't picked up in PACKAGE systemd-analyze. This should fix it:

diff --git a/meta/recipes-core/systemd/systemd_199.bb
b/meta/recipes-core/systemd/systemd_199.bb
index ba1d133..f896187 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -119,7 +119,7 @@ PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup
${PN}-initramfs ${PN}-analyze ${PN}-
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"

-FILES_${PN}-analyze = "${base_bindir}/systemd-analyze"
+FILES_${PN}-analyze = "${bindir}/systemd-analyze"

 FILES_${PN}-initramfs = "/init"
 RDEPENDS_${PN}-initramfs = "${PN}"

Cheers,
Erik


