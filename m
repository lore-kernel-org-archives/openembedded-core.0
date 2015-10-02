Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B182A77088
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 14:23:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t92ENEiE007203
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 2 Oct 2015 07:23:14 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Fri, 2 Oct 2015 07:23:14 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1443723968-43906-1-git-send-email-mark.hatle@windriver.com>
	<1443738661.14733.71.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <560E9351.90003@windriver.com>
Date: Fri, 2 Oct 2015 09:23:13 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443738661.14733.71.camel@linuxfoundation.org>
Cc: david.reyna@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] "Finish" the IMAGE_GEN_DEBUGFS implementation
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
X-List-Received-Date: Fri, 02 Oct 2015 14:23:17 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 10/1/15 5:31 PM, Richard Purdie wrote:
> On Thu, 2015-10-01 at 13:26 -0500, Mark Hatle wrote:
>> It was noticed today that the IMAGE_GEN_DEBUGFS implementation was not 
>> complete.  The version that was merged back in May only contained the 
>> filesystem generation pieces, but not the pieces for creating the image
>> from that filesystem.
>>
>> The code has been tested and is working.  The only thing that I don't 
>> particularly like is that the processing code and loop is a duplicate of
>> the code that runs just before.  Unfortunately the only way around this
>> is to change the way that way the parallel bits are processed to support
>> multiple datastores..  (or create "another" function..)
>>
>> Any feedback appreciated, but without this the feature is broken!
> 
> Could we not make a function which these two code points then call?

The duplicate piece is because the existing setup and loop depend on the local
self.d value(s).  In order to do this, we need to temporarily modify self.d and
run this under an alternative datastore, and then put it back to the original value.

If I don't duplicate the:

            for image_cmds in debugfs_image_cmd_groups:
...
                results = list(pool.imap(generate_image, image_cmds))
...
                for image_type, subimages, script in image_cmds:
                    bb.note("Creating debugfs symlinks for %s image ..." %
image_type)
                    self._create_symlinks(subimages)

there is no concept of two different datastores.

The alternative we have is to include a reference to the datastore itself in the
'image_cmds'.  Then we could support any number of datastores as appropriate for
the commands.  (This of course will require additional changes to be able to
pass that datastore to the various users.)

--Mark



> Cheers,
> 
> Richard
> 


