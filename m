Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 486367398C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 21:28:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 11 Mar 2015 14:22:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,384,1422950400"; d="scan'208";a="697415346"
Received: from localhost.jf.intel.com (HELO [10.7.201.37]) ([10.7.201.37])
	by orsmga002.jf.intel.com with ESMTP; 11 Mar 2015 14:28:12 -0700
Message-ID: <5500B36C.6060304@linux.intel.com>
Date: Wed, 11 Mar 2015 14:28:12 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1426109145-12904-1-git-send-email-randy.e.witt@linux.intel.com>
In-Reply-To: <1426109145-12904-1-git-send-email-randy.e.witt@linux.intel.com>
Subject: Re: [PATCH] lib/oeqa/runtime/systemd: Add a basic runtime test for the journal
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
X-List-Received-Date: Wed, 11 Mar 2015 21:28:14 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Sorry, please ignore this previously submitted patch.

On 03/11/2015 02:25 PM, Randy Witt wrote:
> The test_systemd_journal() test will fail if journalctl exits with a
> non-zero exit status. The exit status is non-zero even if there are no
> journal files, which is what drove the creation of this test.
> [Yocto #7388]
>
> Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
> ---
>   meta/lib/oeqa/runtime/systemd.py | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/meta/lib/oeqa/runtime/systemd.py b/meta/lib/oeqa/runtime/systemd.py
> index 1451698..5935edd 100644
> --- a/meta/lib/oeqa/runtime/systemd.py
> +++ b/meta/lib/oeqa/runtime/systemd.py
> @@ -86,3 +86,9 @@ class SystemdServiceTests(SystemdTest):
>           self.systemctl('is-enabled', 'avahi-daemon.service', expected=1)
>           self.systemctl('enable', 'avahi-daemon.service')
>           self.systemctl('is-enabled', 'avahi-daemon.service')
> +
> +class SystemdJournalTests(SystemdTest):
> +    @skipUnlessPassed('test_ssh')
> +    def test_systemd_journal(self):
> +        (status, output) = self.target.run('journalctl')
> +        self.assertEqual(status, 0, output)
>


