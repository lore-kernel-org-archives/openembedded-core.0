Return-Path: <psidhu@gateworks.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9612C77153
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 15:35:01 +0000 (UTC)
Received: by wijq8 with SMTP id q8so16677994wij.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 08:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hLFrl3GdAU80WyKCaw5Jyx5A9Ap9cTQ4MP7MEhH59j8=;
	b=BZJoY4zmI5KWIzl+dPLF7pabkv+kq10lw6uiyyaH5/eprmp6L8sxb4G3h2xeKdO8wY
	ynhQHUJcIRpB5ndPMSf+xD1lphEe8j8jHbepXmZYfcx852qg9JQSOnnCgOgud2Nctdts
	LM0J2bF9WZXfELDh+liWrKzZuG61ldEB31TWHcFwRS5b5dg9tC8jkVucrbt/B877h/Wz
	JEWbrlLQB9D05zChOzuj8acsHRVZbcxBvNytDH2cb8f8cg3JOxTsK7txfa14dBRiaIpL
	sFXdbvHJUwPM0seH6WqRzKggs7AbJwsj6Fw+L/ZnQpHe0Vwte0/a712PzK0iXDEd63wc
	9UNA==
X-Gm-Message-State: ALoCoQmwpp2KY8jxwijxYwn9+TX8MchM8eZTJllj9fzGvLNYx2Vl4FjwIkD5Cih4ADEZYFPP7gMR
X-Received: by 10.194.114.133 with SMTP id jg5mr17344004wjb.98.1445009701685; 
	Fri, 16 Oct 2015 08:35:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.112.167 with HTTP; Fri, 16 Oct 2015 08:34:32 -0700 (PDT)
In-Reply-To: <CABcZAN=9huQJ2oT=1uK+2F3ME=+KBEHOkWv1qdhrYPHyf_P_Ww@mail.gmail.com>
References: <1444957041-5419-1-git-send-email-psidhu@gateworks.com>
	<CABcZAN=9huQJ2oT=1uK+2F3ME=+KBEHOkWv1qdhrYPHyf_P_Ww@mail.gmail.com>
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Fri, 16 Oct 2015 08:34:32 -0700
Message-ID: <CAD1M062g+pg7ar1wkTmsGOijvPYCBJsYgETRuXFzcpSijPrcVQ@mail.gmail.com>
To: Christopher Larson <chris_larson@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] iw: fix build path
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
X-List-Received-Date: Fri, 16 Oct 2015 15:35:05 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 15, 2015 at 7:18 PM, Christopher Larson
<chris_larson@mentor.com> wrote:
> On Thu, Oct 15, 2015 at 5:57 PM, Pushpal Sidhu <psidhu@gateworks.com> wrote:
>>
>> The source get's checked out into ${PN}-${PV}, not 'build'. Currently,
>> building
>> iw is broken because none of the source files are found.
>
>
> First, this message doesn't make sense. You're implying that bitbake thinks
> B is S, which it does not. Bitbake already knows the correct source tree
> path. The S = you add here is redundant, ${PN}-${PV} is the default value
> for S.
>
> If iw was failing to build with a separate build directory from source,
> you'd just need to remove B. That said, it's not, as far as I can tell. I
> build iw every day as is and it works just fine building with a separate
> build directory from source, so I suspect you have something wrong going on
> in your environment.

I agree with you about setting S, I put it in there to be explicit
(I've seen other package do this for clarity sake). Here are the
errors I'm seeing (even in a clean build):

DEBUG: Executing shell function do_install
NOTE: make -j 4 -f
/usr/src/psidhu/gw-yocto-master/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/iw/4.1-r0/iw-4.1/Makefile
PREFIX=/usr SBINDIR=/usr/sbin MANDIR=/usr/share/man
DESTDIR=/usr/src/psidhu/gw-yocto-master/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/iw/4.1-r0/image
install
 GEN  version.c
 CC   version.o
 CC   iw
arm-poky-linux-gnueabi-gcc: error: iw.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: genl.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: event.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: info.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: phy.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: interface.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: ibss.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: station.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: survey.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: util.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: ocb.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: mesh.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: mpath.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: mpp.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: scan.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: reg.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: reason.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: status.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: connect.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: link.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: offch.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: ps.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: cqm.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: bitrate.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: wowlan.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: coalesce.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: roc.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: p2p.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: vendor.o: No such file or directory
arm-poky-linux-gnueabi-gcc: error: sections.o: No such file or directory
make: *** [iw] Error 1
ERROR: oe_runmake failed
ERROR: Function failed: do_install (log file is located at
/usr/src/psidhu/gw-yocto-master/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/iw/4.1-r0/temp/log.do_install.24334)

- Pushpal

