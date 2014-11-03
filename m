Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 531886FCA3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 14:55:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA3Et5SX008234
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Nov 2014 06:55:05 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Mon, 3 Nov 2014 06:55:05 -0800
Message-ID: <54579748.5000303@windriver.com>
Date: Mon, 3 Nov 2014 08:55:04 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1414925318-15353-1-git-send-email-pab@pabigot.com>
In-Reply-To: <1414925318-15353-1-git-send-email-pab@pabigot.com>
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
X-List-Received-Date: Mon, 03 Nov 2014 14:55:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/14, 4:48 AM, Peter A. Bigot wrote:
> A classic approach to building SD card images with varying rootfs sizes
> is to create the filesystem and unpack a tar rootfs image onto it.  When
> done outside pseudo the encoded user and group names from the tar file
> are converted to identifiers using host files, which often result in
> incorrect assignment for common names like messagebus and ntp.
>
> A solution is to create the rootfs archive using the numeric values
> obtained from the target /etc files under pseudo, rather than the
> corresponding names.  This series provides this function as a new image
> file format "nug.tar".
>
> Peter A. Bigot (2):
>    image_types.bbclass: whitespace and reorder
>    image_types.bbclass: add tar --numeric-owner support
>
>   meta/classes/image_types.bbclass | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
>

I think this is incorrect.

The current tar archives contain both the uname/gname -and- uid/gid.  When you 
extract, if you pass --numeric-owner it will switch from name to number.  (At 
least it has whenever I've done it.)  The default though is to use the uname/gname.

The issue with switching to uid/gid is that you can end up changing the default 
and you may enough end up dumping the name version.  This can cause security 
issues if you do partial extracts and there was some type of a mismatch between 
the original system and the one being extracted.  (Think field 
upgrade/debug/update cycle.)

--Mark

