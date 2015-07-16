Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B7F4E6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 10:55:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Jul 2015 03:55:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,487,1432623600"; d="scan'208";a="748479811"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO [10.252.4.22])
	([10.252.4.22])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jul 2015 03:55:34 -0700
Message-ID: <1437044133.16819.37.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: Pau Espin Pedrol <pespin.shar@gmail.com>
Date: Thu, 16 Jul 2015 13:55:33 +0300
In-Reply-To: <CAEGpDuYVEB0Y5T+SqybCfagCkO1rA1A66toZdYz_EMWGEc87aw@mail.gmail.com>
References: <1436537056-4626-1-git-send-email-pau.espin@aweurope.be>
	<CAJTo0LbpxBHh8mv7qqKMkVmBcoQ=ckjt3+4ipahMwtqUUkZr1A@mail.gmail.com>
	<CAEGpDuYVEB0Y5T+SqybCfagCkO1rA1A66toZdYz_EMWGEc87aw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - PL 281, 00181 Helsinki
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: Pau Espin Pedrol <pau.espin@aweurope.be>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] pulseaudio: add systemd to PACKAGECONFIG if enabled in DISTRO_FEATURES
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
X-List-Received-Date: Thu, 16 Jul 2015 10:55:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-07-13 at 12:23 +0200, Pau Espin Pedrol wrote:
> Hi,
> 
> I am not sure which is the behavior with those paths right now and how
> it should be.
> 
> I just checked this:
> http://www.freedesktop.org/software/systemd/man/systemd.unit.html#Unit%20Load%20Path
> 
> So, it seems according to documentation that system services should be
> installed under /usr/lib/systemd/system, but currently they are
> installed in /lib/systemd/system in my generated image. Is that a
> expected behaviour? Shouldn't we try to follow documentation? I see
> that sometimes /lib/systemd/system path is appended to the dirs in
> systemdsystemunitpath, but it's not stated in the documentation,
> that's a bit strange.
> 
> For user services, /usr/lib/systemd/user is already being used as
> stated in docs.
> 
> Now, when multilib comes in, I get lost. If I understand correctly,
> with multilib enabled we have too /lib64 and /usr/lib64. Are then
> systemd service files suppoused to be installed in /usr/lib/systemd/
> or in /usr/lib64/systemd/ ? If I undersood correctly your comment you
> meant they should still be going into /usr/lib/systemd right?
> 
> Now, talking about bitbake.conf. I see there's already a line with the
> following:
> export systemd_unitdir = "/lib/systemd"
> 
> So, apart from your nonarch issue, I think it would also be a good
> idea to split systemd_unitdir into system and user, as done by
> provided pc in systemd (src/core/systemd.pc.in):
> 1- If still want system services to be in /lib and user services to be
> in /usr/lib:
> export nonarch_libdir = "${prefix}/lib"
> 
> export systemd_system_unitdir = "${nonarch_base_libdir}/systemd/system"
> export systemd_user_unitdir = "${nonarch_libdir}/systemd/user"
> or
> export systemd_system_unitdir = "${nonarch_base_libdir}/systemd"
> export systemd_user_unitdir = "${nonarch_libdir}/systemd"
> 
> 
> 2- If you want both in /usr/lib:
> export nonarch_libdir = "${prefix}/lib"
> 
> export systemd_system_unitdir = "${nonarch_libdir}/systemd/system"
> export systemd_user_unitdir = "${nonarch_libdir}/systemd/user"
> or
> export systemd_system_unitdir = "${nonarch_libdir}/systemd"
> export systemd_user_unitdir = "${nonarch_libdir}/systemd"

This thread is still lacking a conclusion about how to set up the
unitdir variables in bitbake.conf. FWIW, in my opinion this is the best
option:

export systemd_system_unitdir = "${nonarch_libdir}/systemd/system"
export systemd_user_unitdir = "${nonarch_libdir}/systemd/user"

systemd_unitdir with the old value probably needs to be kept around for
compatibility, though.

-- 
Tanu


