Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-10.prod.phx3.secureserver.net
	(p3plsmtpa09-10.prod.phx3.secureserver.net [173.201.193.239])
	by mail.openembedded.org (Postfix) with ESMTP id 14E8F6E5DC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 15:19:39 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa09-10.prod.phx3.secureserver.net with 
	id B3Ke1p0060BVjqb013Ke0e; Mon, 03 Nov 2014 08:19:39 -0700
Message-ID: <54579D0A.5030206@pabigot.com>
Date: Mon, 03 Nov 2014 09:19:38 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1414925318-15353-1-git-send-email-pab@pabigot.com>
	<54579748.5000303@windriver.com>
In-Reply-To: <54579748.5000303@windriver.com>
Subject: Re: [PATCH 0/2] support numeric owner/group tar image format
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
X-List-Received-Date: Mon, 03 Nov 2014 15:19:41 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/03/2014 08:55 AM, Mark Hatle wrote:
> On 11/2/14, 4:48 AM, Peter A. Bigot wrote:
>> A classic approach to building SD card images with varying rootfs sizes
>> is to create the filesystem and unpack a tar rootfs image onto it.  When
>> done outside pseudo the encoded user and group names from the tar file
>> are converted to identifiers using host files, which often result in
>> incorrect assignment for common names like messagebus and ntp.
>>
>> A solution is to create the rootfs archive using the numeric values
>> obtained from the target /etc files under pseudo, rather than the
>> corresponding names.  This series provides this function as a new image
>> file format "nug.tar".
>>
>> Peter A. Bigot (2):
>>    image_types.bbclass: whitespace and reorder
>>    image_types.bbclass: add tar --numeric-owner support
>>
>>   meta/classes/image_types.bbclass | 18 +++++++++++++++++-
>>   1 file changed, 17 insertions(+), 1 deletion(-)
>>
>
> I think this is incorrect.
>
> The current tar archives contain both the uname/gname -and- uid/gid.  
> When you extract, if you pass --numeric-owner it will switch from name 
> to number.  (At least it has whenever I've done it.)  The default 
> though is to use the uname/gname.

You're correct; both are stored per: 
http://www.gnu.org/software/tar/manual/html_node/Standard.html

This should probably be publicized more widely, since when the issue 
came up recently I wasn't the only one who discovered the hand-generated 
images had the wrong uid/gid values for non-root files.  Unnecessarily, 
as it turns out: adding --numeric-owner to the unpack does solve the 
problem.

Thanks.  I'll archive both patches in patchwork (the first is still 
valid, but is now unmotivated).

Peter

