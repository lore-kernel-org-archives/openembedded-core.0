Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-10.prod.phx3.secureserver.net
	(p3plsmtpa07-10.prod.phx3.secureserver.net [173.201.192.239])
	by mail.openembedded.org (Postfix) with ESMTP id 25EB36A362
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 12:00:33 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa07-10.prod.phx3.secureserver.net with 
	id 2c0X1p0040BVjqb01c0XCV; Mon, 13 Oct 2014 05:00:34 -0700
Message-ID: <543BBEDE.20103@pabigot.com>
Date: Mon, 13 Oct 2014 07:00:30 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <543965E7.3040806@pabigot.com> <543AED25.7070201@pabigot.com>
	<2427853.ctRZJaqR28@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <2427853.ctRZJaqR28@peggleto-mobl5.ger.corp.intel.com>
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
X-List-Received-Date: Mon, 13 Oct 2014 12:00:43 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/2014 04:13 AM, Paul Eggleton wrote:
> On Sunday 12 October 2014 16:05:41 Peter A. Bigot wrote:
>> On 10/11/2014 12:16 PM, Peter A. Bigot wrote:
>>> Back at
>>> http://lists.openembedded.org/pipermail/openembedded-core/2011-December/05
>>> 3836.html it was noted that the dbus home directory /var/lib/dbus on the
>>> target was using the build host uid/gid.  Various discussion agreed this
>>> shouldn't happen, but there was no resolution in the thread.
>>>
>>> I found https://bugzilla.yoctoproject.org/show_bug.cgi?id=1711 which
>>> is marked fixed, but on a newly installed system I find:
>>>
>>> root@beaglebone:~# ls -l /var/lib
>>> total 52
>>> drwxr-xr-x 2 root root 4096 Oct 11  2014 alsa
>>> drwxr-xr-x 2 root root 4096 Oct 11  2014 arpd
>>> drwxr-xr-x 2 root root 4096 Oct 11 12:30 connman
>>> drwxr-xr-x 2  102  105 4096 Oct 11  2014 dbus
>>>
>>> where the dbus uid/gid is from my host system as shown by:
>>>
>>> root@beaglebone:~# grep dbus /etc/passwd
>>> messagebus:x:999:998::/var/lib/dbus:/bin/false
>>> llc[140]$ grep dbus /etc/passwd
>>> messagebus:x:102:105::/var/run/dbus:/bin/false
>> Pilot error.  This ultimately turned out to be a side-effect of the way
>> I create my image media: I unpacking the rootfs tar file onto a mounted
>> sdcard outside the pseudo environment and forgot that tar records
>> user/group by name not uid/gid.
> I used to use this method previously, and I guess it can still work if you're
> not including certain packages in your image - but I wonder if we should note
> this potential pitfall somewhere in the documentation. I'm not entirely sure
> where such a note would go, though.

Possibly in the section on wic or anything that descibes image building, 
since I expect wic doesn't have this issue.  I haven't used kickstart 
for years but really liked the approach when I did, so I'll be switching 
to wic next time I'm actively working OE. Arguably the classic 
tar/cpio/non-fs rootfs images are fragile unless there's a way to unpack 
them onto runtime media that preserves the name/id mappings defined 
within the image itself.

Peter

