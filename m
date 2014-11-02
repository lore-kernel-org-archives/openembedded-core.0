Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-02.prod.phx3.secureserver.net
	(p3plsmtpa07-02.prod.phx3.secureserver.net [173.201.192.231])
	by mail.openembedded.org (Postfix) with ESMTP id CD7F270620
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Nov 2014 15:10:29 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa07-02.prod.phx3.secureserver.net with 
	id AfAU1p0060BVjqb01fAUVB; Sun, 02 Nov 2014 08:10:29 -0700
Message-ID: <54564964.60906@pabigot.com>
Date: Sun, 02 Nov 2014 09:10:28 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1414925318-15353-1-git-send-email-pab@pabigot.com>	
	<1414925318-15353-3-git-send-email-pab@pabigot.com>
	<1414940466.5111.0.camel@ted>
In-Reply-To: <1414940466.5111.0.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] image_types.bbclass: add tar --numeric-owner support
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
X-List-Received-Date: Sun, 02 Nov 2014 15:10:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/02/2014 09:01 AM, Richard Purdie wrote:
> On Sun, 2014-11-02 at 04:48 -0600, Peter A. Bigot wrote:
>> tar format normally stores user and group as names, which is the right
>> thing to use when target passwd and group files are available.  When
>> unpacking a rootfs archive onto a mounted SD card partition on a build
>> host outside the pseudo environment the host passwd/group files will be
>> used for name-to-id mapping, which results in mis-assigned identifiers
>> (often for important ids like messagebus).
>>
>> Using IMAGE_FSTYPES += "nug.tar" creates rootfs.nug.tar files where the
>> owner and group are specified numerically, using the target IDs obtained
>> when the archive is built under pseudo.
>>
>> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
>> ---
>>   meta/classes/image_types.bbclass | 2 ++
>>   1 file changed, 2 insertions(+)
> Shouldn't we always do this?
>
> I'm trying to figure out when this would be a bad idea...

I read 
http://www.mail-archive.com/openembedded-core%40lists.openembedded.org/msg45147.html 
as suggesting you thought otherwise.

But no, I think using names is generally appropriate.  It's what the 
underlying packages use (well, RPM at least; I didn't check others).  
It's nice in that it does allow you to see the owner and group from tar 
-tav without having to unpack /etc to get the uid/gid mappings.  If you 
unpack it on a development machine to see what's in it, chances are the 
files will end up owned by the right users. And it works just fine in 
the standard Yocto environment that uses pseudo to map names, as 
(perhaps) wic using it to create a new custom rootfs might do.

Pretty much the only situation where it doesn't work is unpacking it as 
root not using pseudo in a context you really want the resulting uid/gid 
to be what they'll be on the target.  That's a pretty important use 
case, but not IMO enough to change the default from what it's "always 
been", especially as it'll go away once wic matures a little.

Peter


