Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6A3B8770C8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 14:57:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t92EvN4r013546
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Oct 2015 07:57:23 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Fri, 2 Oct 2015 07:57:23 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1443797624-183169-1-git-send-email-mark.hatle@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <560E9B52.1080101@windriver.com>
Date: Fri, 2 Oct 2015 09:57:22 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443797624-183169-1-git-send-email-mark.hatle@windriver.com>
Cc: david.reyna@windriver.com
Subject: Re: [PATCH v2] "Finish" the IMAGE_GEN_DEBUGFS implementation
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
X-List-Received-Date: Fri, 02 Oct 2015 14:57:24 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 10/2/15 9:53 AM, Mark Hatle wrote:
> V2:
> By adjusting the _write_script function (and associated _get_imagecmds) the
> script may optionally pass in a prefix for the generated script.  This solves
> one of the problems in the prior version.  (No more script name collisions.)
> 
> The second issue is that the datastore is used to find various parameters
> (which are different in the DEBUGFS datastore) when doing the final symlink
> generation.
> 
> So we do have to switch (based on the script prefix) which datastore we
> should be using.  (Note, I'm not completely sure that the switch is 'safe',
> so this is an area that should be verified.)

And I verified, it is indeed not safe..

The script name is set by:

        script_name = os.path.join(tempdir, sprefix + "create_image." + type)

So I'd need to exclude the tempdir ($T) in order for the test to be right.. and
even then it probably should be a 'startwith' comparison?

Does this seem right to others?

--Mark

> V1:
> 
> It was noticed today that the IMAGE_GEN_DEBUGFS implementation was not 
> complete.  The version that was merged back in May only contained the 
> filesystem generation pieces, but not the pieces for creating the image
> from that filesystem.
> 
> The code has been tested and is working.  The only thing that I don't 
> particularly like is that the processing code and loop is a duplicate of
> the code that runs just before.  Unfortunately the only way around this
> is to change the way that way the parallel bits are processed to support
> multiple datastores..  (or create "another" function..)
> 
> Any feedback appreciated, but without this the feature is broken!
> 
> Mark Hatle (1):
>   lib/oe/image.py: Add image generation for companion debug filesystem
> 
>  meta/conf/documentation.conf         |  2 ++
>  meta/conf/local.conf.sample.extended |  9 +++++++++
>  meta/lib/oe/image.py                 | 37 +++++++++++++++++++++++++++++++-----
>  3 files changed, 43 insertions(+), 5 deletions(-)
> 


