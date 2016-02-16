Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7024F7316D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 15:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1GFEV2j017864; Tue, 16 Feb 2016 15:14:31 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id n12YmLSdRo3K; Tue, 16 Feb 2016 15:14:31 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1GFERcd017858
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 16 Feb 2016 15:14:28 GMT
Message-ID: <1455635667.28376.16.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Daniel Istrate <daniel.alexandrux.istrate@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 16 Feb 2016 15:14:27 +0000
In-Reply-To: <1455635341-28822-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1455635341-28822-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] oeqa/selftest/bbtests: Test bitbake --setscene-only option
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
X-List-Received-Date: Tue, 16 Feb 2016 15:14:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-02-16 at 17:09 +0200, Daniel Istrate wrote:
> Bitbake option to restore from sstate only within a build
> (i.e. execute no real tasks, only setscene)
> 
> fix for [YOCTO #8876]
> 
> Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
> ---
>  meta/lib/oeqa/selftest/bbtests.py | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/bbtests.py
> b/meta/lib/oeqa/selftest/bbtests.py
> index 42ae9d0..b581b2b 100644
> --- a/meta/lib/oeqa/selftest/bbtests.py
> +++ b/meta/lib/oeqa/selftest/bbtests.py
> @@ -232,3 +232,17 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
>          self.assertEqual(result.status, 0, "Bitbake failed, exit
> code %s, output %s" % (result.status, result.output))
>          self.assertFalse(os.path.isfile(os.path.join(self.builddir,
> 'tmp/deploy/licenses/readline/generic_GPLv3')))
>          self.assertTrue(os.path.isfile(os.path.join(self.builddir,
> 'tmp/deploy/licenses/readline/generic_GPLv2')))
> +
> +    @testcase(1422)
> +    def test_setscene_only(self):
> +        """ Bitbake option to restore from sstate only within a
> build (i.e. execute no real tasks, only setscene)"""
> +        test_recipe = 'ed'
> +
> +        bitbake(test_recipe)
> +        bitbake('-c clean %s' % test_recipe)
> +        ret = bitbake('--setscene-only %s' % test_recipe)
> +
> +        tasks = re.findall(r'task\s+(do_\S+):', ret.output)
> +
> +        for task in tasks:
> +            self.assertIn('_setscene', task, 'A task different from
> _setscene ran: %s' % task)

If this fails, it would be helpful to share "tasks" in the output so we
can see which task was executed.

We've had problems with various tests where they show a failure but
without enough information to debug them.

Cheers,

Richard

