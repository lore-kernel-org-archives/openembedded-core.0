Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6AF106A362
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 09:13:29 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Oct 2014 02:13:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="399312170"
Received: from brianbro-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.144])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Oct 2014 02:06:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Peter A. Bigot" <pab@pabigot.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 13 Oct 2014 10:13:28 +0100
Message-ID: <2427853.ctRZJaqR28@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.1 (Linux/3.16.4-200.fc20.x86_64; KDE/4.14.1; x86_64; ; )
In-Reply-To: <543AED25.7070201@pabigot.com>
References: <543965E7.3040806@pabigot.com> <543AED25.7070201@pabigot.com>
MIME-Version: 1.0
Subject: Re: dbus build host uid/gid leaking into target home directory
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
X-List-Received-Date: Mon, 13 Oct 2014 09:13:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 12 October 2014 16:05:41 Peter A. Bigot wrote:
> On 10/11/2014 12:16 PM, Peter A. Bigot wrote:
> > Back at
> > http://lists.openembedded.org/pipermail/openembedded-core/2011-December/05
> > 3836.html it was noted that the dbus home directory /var/lib/dbus on the
> > target was using the build host uid/gid.  Various discussion agreed this
> > shouldn't happen, but there was no resolution in the thread.
> > 
> > I found https://bugzilla.yoctoproject.org/show_bug.cgi?id=1711 which
> > is marked fixed, but on a newly installed system I find:
> > 
> > root@beaglebone:~# ls -l /var/lib
> > total 52
> > drwxr-xr-x 2 root root 4096 Oct 11  2014 alsa
> > drwxr-xr-x 2 root root 4096 Oct 11  2014 arpd
> > drwxr-xr-x 2 root root 4096 Oct 11 12:30 connman
> > drwxr-xr-x 2  102  105 4096 Oct 11  2014 dbus
> > 
> > where the dbus uid/gid is from my host system as shown by:
> > 
> > root@beaglebone:~# grep dbus /etc/passwd
> > messagebus:x:999:998::/var/lib/dbus:/bin/false
> > llc[140]$ grep dbus /etc/passwd
> > messagebus:x:102:105::/var/run/dbus:/bin/false
> 
> Pilot error.  This ultimately turned out to be a side-effect of the way
> I create my image media: I unpacking the rootfs tar file onto a mounted
> sdcard outside the pseudo environment and forgot that tar records
> user/group by name not uid/gid.

I used to use this method previously, and I guess it can still work if you're 
not including certain packages in your image - but I wonder if we should note 
this potential pitfall somewhere in the documentation. I'm not entirely sure 
where such a note would go, though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

