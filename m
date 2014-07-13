Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6334365E2D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Jul 2014 23:49:03 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id pv20so2292157lab.37
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Jul 2014 16:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:in-reply-to:message-id:references
	:user-agent:mime-version:content-type;
	bh=PWE1COJ+Xyqb3I/LvtFEzwMetSPmDFjZ8cCUsaSMUsk=;
	b=J10UuG0aZBii00UI1rESq8NDI4E+APOft+kOAEw3GCo+FOaG7T6JIRkavqwpi3dhmX
	T8GDA4wd/SezN7M3wdmEy4L01fdlac8n92pfWP32mvkteqpv0z/2u917W2OUBDgsV11/
	s/dgt+5Xb1rJw+cdH8hcR0wiWT0kbbn8wkv79E9XYEXnQKTvIdcNbj9febQ59zRKRyUO
	yXxPTdG/dbw7MysTSYJMDDiZNmxs45hAgj1RAPN7QhoauaniSLp8431CHULfWu53IgbO
	9jr7iVa/T/jYO9whX6eOrSamhlFQU5LUVTM5vqa8VArLVB9Yq0X+Nbyw+/mp0q5iAWfv
	6VsQ==
X-Received: by 10.152.180.168 with SMTP id dp8mr11404323lac.11.1405295343769; 
	Sun, 13 Jul 2014 16:49:03 -0700 (PDT)
Received: from localhost.localdomain (89-253-118-72.customers.ownit.se.
	[89.253.118.72])
	by mx.google.com with ESMTPSA id k5sm4512237lak.8.2014.07.13.16.49.02
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Jul 2014 16:49:03 -0700 (PDT)
Date: Mon, 14 Jul 2014 01:48:47 +0200 (CEST)
From: Jacob Kroon <jacob.kroon@gmail.com>
X-X-Sender: jkroon@localhost.localdomain
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1404938578.15985.59.camel@ted>
Message-ID: <alpine.LFD.2.11.1407140142470.30533@localhost.localdomain>
References: <cover.1404896873.git.roxana.ciobanu@intel.com>
	<fc1e780d3862d570820104c388a20e2b6d832c89.1404896873.git.roxana.ciobanu@intel.com>
	<1404938578.15985.59.camel@ted>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.bbclass: add ROOTFS_POSTPROCESS_COMMAND to rootfs[vardeps]
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
X-List-Received-Date: Sun, 13 Jul 2014 23:49:07 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Wed, 9 Jul 2014, Richard Purdie wrote:

> On Wed, 2014-07-09 at 12:08 +0300, Roxana Ciobanu wrote:
>>     Changes to ROOTFS_POSTPROCESS_COMMAND require the rootfs
>>     for the image to be rebuilt.
>>
>>     [YOCTO #6502]
>>
>> Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
>> ---
>>  meta/classes/image.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index a03b880..e088bdb 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -75,7 +75,7 @@ LDCONFIGDEPEND_libc-musl = ""
>>  do_rootfs[depends] += "makedevs-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot ${LDCONFIGDEPEND}"
>>  do_rootfs[depends] += "virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot"
>>  do_rootfs[recrdeptask] += "do_packagedata"
>> -do_rootfs[vardeps] += "BAD_RECOMMENDATIONS NO_RECOMMENDATIONS"
>> +do_rootfs[vardeps] += "BAD_RECOMMENDATIONS NO_RECOMMENDATIONS ROOTFS_POSTPROCESS_COMMAND"
>>
>>  do_build[depends] += "virtual/kernel:do_deploy"
>
> Are there other variables we look at in the rootfs process we also need
> to list here?
>
> As background, the move to lib/oe has moved the variables outside the
> scope of bitbake's function parsing code so we need to handle that
> manually now...
>

I was hit by this recently, and talked to kergoth on IRC about it.
As he suggested, perhaps we should also do

ROOTFS_POSTPROCESS_COMMAND[func] = "1"

to inform bitbake that it is a shell script, so that it invokes its 
shell dependency parsing. I would guess most people add a function, 
and append this to ROOTFS_POSTPROCESS_COMMAND. Without marking it as a 
function, changes in the actual function body would not trigger rootfs 
rebuilds.

/Jacob

