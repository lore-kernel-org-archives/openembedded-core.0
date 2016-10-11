Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 5CBB260765
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 12:26:21 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 92F1368A01C; Tue, 11 Oct 2016 13:26:22 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 3D6FF68A019;
	Tue, 11 Oct 2016 13:26:18 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id A963D674028F;
	Tue, 11 Oct 2016 14:26:17 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <1476188384-16064-1-git-send-email-ross.burton@intel.com>
	<1476188384-16064-2-git-send-email-ross.burton@intel.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <9eb3fd87-b56b-ce59-7c85-f0d4fa4d3500@mlbassoc.com>
Date: Tue, 11 Oct 2016 14:26:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1476188384-16064-2-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH 2/2] insane: display names instead of ELF machine numbers
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
X-List-Received-Date: Tue, 11 Oct 2016 12:26:22 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-10-11 14:19, Ross Burton wrote:
> The 'arch' QA test currently simply outputs the ELF machine field as a number
> which isn't helpful.  Display this as a human-readable name to make it clearer
> to the user what the problem is.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/insane.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index b347638..17c9284 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -543,8 +543,8 @@ def package_qa_check_arch(path,name,d, elf, messages):
>      # Check the architecture and endiannes of the binary
>      if not ((machine == elf.machine()) or \
>          ((("virtual/kernel" in provides) or bb.data.inherits_class("module", d) ) and (target_os == "linux-gnux32" or target_os == "linux-gnun32"))):
> -        package_qa_add_message(messages, "arch", "Architecture did not match (%d to %d) on %s" % \
> -                 (machine, elf.machine(), package_qa_clean_path(path,d)))
> +        package_qa_add_message(messages, "arch", "Architecture did not match (%s, expected %s) on %s" % \
> +                 (oe.qa.elf_machine_to_string(elf.machine()), oe.qa.elf_machine_to_string(machine), package_qa_clean_path(path,d)))
>      elif not ((bits == elf.abiSize()) or  \
>          ((("virtual/kernel" in provides) or bb.data.inherits_class("module", d) ) and (target_os == "linux-gnux32" or target_os == "linux-gnun32"))):
>          package_qa_add_message(messages, "arch", "Bit size did not match (%d to %d) %s on %s" % \
>

Did you mean to swap the items?  The old version used
   machine, elf.machine()
and this version uses
   elf.machine(), machine

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

