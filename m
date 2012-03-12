Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S7Axr-0000Fo-He
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 20:31:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 59B693159077;
	Mon, 12 Mar 2012 20:22:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Dd+8hXfeA6bD; Mon, 12 Mar 2012 20:22:35 +0100 (CET)
Received: from [172.22.22.61] (drms-590cffcf.pool.mediaWays.net
	[89.12.255.207])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 210A4315A01A;
	Mon, 12 Mar 2012 20:22:35 +0100 (CET)
Message-ID: <4F5E4CF9.3070104@opendreambox.org>
Date: Mon, 12 Mar 2012 20:22:33 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1331154474-17257-1-git-send-email-obi@opendreambox.org>
	<4F5E3949.7050307@linux.intel.com>
In-Reply-To: <4F5E3949.7050307@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][resend] python-native: distutils: don't use libdir, remove dead code path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Mar 2012 19:31:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12.03.2012 18:58, Saul Wold wrote:
> On 03/07/2012 01:07 PM, Andreas Oberritter wrote:
>> * Coming from OE-classic it was surprising that python-native now
>>    requires 'libdir' to be exported. Otherwise autoconf would fail
>>    to detect python libraries. This happend using a customized
>>    environment setup script to use OE's compiler and libs without
>>    bitbake.
>> * Use sys.lib instead of libdir's suffix.
>> * While at it, simplify redundant if/and-statments.
>>
>> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
>> ---
>> * This patch hasn't been commented since its first submission
>>    on Feb 21st.
>> * Original patch URL: http://patches.openembedded.org/patch/21481/
>>
>>   ...2-distutils-prefix-is-inside-staging-area.patch |   15
>> +++++----------
>>   1 files changed, 5 insertions(+), 10 deletions(-)
>>
> This will need a PR bump so the modified patch will be noticed, I know
> this patch was put in a while ago.

Right. I'm waiting before resubmitting it. See below.

> I am not so sure about the changes though, I have been meaning to dig
> into this, the orignial code looks strange in that it includes
> plat_specific in the else clause!  You are also dropping the EXEC_PREFIX

I'm dropping EXEC_PREFIX, because it's dead code.

The code from the original patch can be rewritten as:

if plat_specific:
	if plat_specific:
		prefix = os.environ['STAGING_LIBDIR'].rstrip(lib_basename)
else:
	if plat_specific:
		prefix = EXEC_PREFIX
	else:
		prefix = PREFIX

Does this make it clear?
 
> How have you tested this change?

I built from scratch and also runtime tested it, but without multilib. 

As I'm currently investing a different problem in python, digging into
python internals, I doubt that sys.lib really contains the correct
value for multilib, unless multilib builds have multiple python-natives.

I think it would be better to just drop the last element of STAGING_LIBDIR,
i.e.:

if plat_specific:
	prefix = '/'.join(os.environ['STAGING_LIBDIR'].split('/')[:-1])
else:
	prefix = PREFIX

Do you think this would be OK?

Regards,
Andreas


