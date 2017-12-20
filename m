Return-Path: <prvs=520e85a88=Martin.Hundeboll@prevas.dk>
Received: from mail02.prevas.se (mail02.prevas.se [62.95.78.10])
	by mail.openembedded.org (Postfix) with ESMTP id AF10071A74
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 08:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=3127; q=dns/txt;
	s=ironport2; t=1513756834; x=1545292834;
	h=from:subject:to:references:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=UDpWQ7VpQbkCxF4mA2JXnGxWGY4rWq+M3ml6EGqaRJU=;
	b=XowFtftAetDuCGAljD0+jCCiheUp1a22hymTF5QpWh27yJlHDHyDMKzf
	ebuLKswzwE3PBjZ60zYwTlaZtP7XMxf5OxyZg0yLeoWljXIfwcdGy0QHm
	aVxkfa5CFPzqe9b37FhRutdeP0SnOsvp7jSjo1WjAIhva9dGuC6UOjSIL g=;
X-IronPort-AV: E=Sophos;i="5.45,430,1508796000"; 
   d="scan'208";a="2832612"
Received: from vmprevas4.prevas.se (HELO smtp.prevas.se) ([172.16.8.104])
	by ironport2.prevas.se with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Dec 2017 09:00:33 +0100
Received: from [172.16.11.15] (172.16.8.31) by smtp.prevas.se (172.16.8.104)
	with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 20 Dec 2017 09:00:33 +0100
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
To: California Sullivan <california.l.sullivan@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20171219225831.22587-1-california.l.sullivan@intel.com>
	<20171219225831.22587-2-california.l.sullivan@intel.com>
Message-ID: <24658eec-63d5-ee07-4fe0-96b9c31d45f4@prevas.dk>
Date: Wed, 20 Dec 2017 09:00:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171219225831.22587-2-california.l.sullivan@intel.com>
X-Originating-IP: [172.16.8.31]
Subject: Re: [PATCH RFC 01/18] fs-uuid.bbclass: rewrite get_fs_uuid function
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
X-List-Received-Date: Wed, 20 Dec 2017 08:00:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

On 2017-12-19 23:58, California Sullivan wrote:
> I couldn't find anywhere it was being used, and in trying to use it it
> just spit out an error.
> 
> It now generates a random UUID and puts it in the deploy dir for
> consumption.
> 
> Also use DISK_SIGNATURE_UUID for the replacement function, since that
> is user-overridable.
> 
> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
> ---
>   meta/classes/fs-uuid.bbclass | 32 ++++++++++++++++++++++----------
>   1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/meta/classes/fs-uuid.bbclass b/meta/classes/fs-uuid.bbclass
> index 9b53dfba7ab..5a96054294e 100644
> --- a/meta/classes/fs-uuid.bbclass
> +++ b/meta/classes/fs-uuid.bbclass
> @@ -1,16 +1,26 @@
> +inherit deploy
> +
>   # Extract UUID from ${ROOTFS}, which must have been built
>   # by the time that this function gets called. Only works
>   # on ext file systems and depends on tune2fs.
>   def get_rootfs_uuid(d):
> -    import subprocess
> -    rootfs = d.getVar('ROOTFS')
> -    output = subprocess.check_output(['tune2fs', '-l', rootfs])
> -    for line in output.split('\n'):
> -        if line.startswith('Filesystem UUID:'):
> -            uuid = line.split()[-1]
> -            bb.note('UUID of %s: %s' % (rootfs, uuid))
> -            return uuid
> -    bb.fatal('Could not determine filesystem UUID of %s' % rootfs)
> +    import os
> +    import uuid
> +    deploydir = d.getVar('DEPLOY_DIR_IMAGE')
> +    bootfs_uuid_file = deploydir + "/bootfs-uuid"

Maybe use a default assigned class variable here instead of the 
hard-coded "bootfs-uuid". The class is named "get_rootfs_uuid", so I 
would expect it to handle multiple cases.

> +    uuid_str = "deadbeef-dead-beef-dead-beefdeadbeef"
> +    if d.getVar('BUILD_REPRODUCIBLE_BINARIES', True) != "1":
> +        if os.path.exists(bootfs_uuid_file):
> +            with open(bootfs_uuid_file, "r+") as file:
> +                uuid_str = file.read()
> +        else:
> +            # deploydir might not exist yet...creating it here could be bad?
> +            if not os.path.exists(deploydir):
> +                os.makedirs(deploydir)
> +            uuid_str = str(uuid.uuid4())
> +            with open(bootfs_uuid_file, "w") as file:
> +                file.write(uuid_str)
> +    return uuid_str
>   
>   # Replace the special <<uuid-of-rootfs>> inside a string (like the
>   # root= APPEND string in a syslinux.cfg or systemd-boot entry) with the
> @@ -19,6 +29,8 @@ def get_rootfs_uuid(d):
>   def replace_rootfs_uuid(d, string):
>       UUID_PLACEHOLDER = '<<uuid-of-rootfs>>'
>       if UUID_PLACEHOLDER in string:
> -        uuid = get_rootfs_uuid(d)
> +        uuid = d.getVar('DISK_SIGNATURE_UUID', True)
>           string = string.replace(UUID_PLACEHOLDER, uuid)
>       return string
> +
> +DISK_SIGNATURE_UUID ?= "${@get_rootfs_uuid(d)}"
> 

-- 
MARTIN HUNDEBØLL, Prevas A/S
Software Developer

Hedeager 3, DK-8200 Aarhus N
Phone +45 87438070
Mobile +45 25562438
Martin.Hundeboll@prevas.dk
www.prevas.com

