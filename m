Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 28EF26D4D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 15:49:02 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAPFmvdV010746; Mon, 25 Nov 2013 15:48:57 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id M7KHzxlMYjHm; Mon, 25 Nov 2013 15:48:56 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAPFmnHi010741
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 25 Nov 2013 15:48:51 GMT
Message-ID: <1385394527.24083.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>
Date: Mon, 25 Nov 2013 15:48:47 +0000
In-Reply-To: <1385392815-29916-1-git-send-email-mac@mcrowe.com>
References: <1385392815-29916-1-git-send-email-mac@mcrowe.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] sanity: Use random filename for maximum path length test
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
X-List-Received-Date: Mon, 25 Nov 2013 15:49:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-11-25 at 15:20 +0000, Mike Crowe wrote:
> check_create_long_filename used a fixed filename for its test files. This
> meant that os.remove(testfile) could fail with ENOENT if two instances were
> running at the same time against the same sstate directory. Using a
> randomly generated filename stops this from happening.
> 
> (Although it might seem unlikely, this race did appear to occur multiple
> times with Jenkins - presumably because the matrix jobs were all kicked off
> at the same time.)
> 
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  meta/classes/sanity.bbclass |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

We've been puzzling over this on the project autobuilder too, although I
didn't spot why, nicely found!

Cheers,

Richard

> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 6807a23..0d40792 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -175,7 +175,8 @@ def check_conf_exists(fn, data):
>      return False
>  
>  def check_create_long_filename(filepath, pathname):
> -    testfile = os.path.join(filepath, ''.join([`num`[-1] for num in xrange(1,200)]))
> +    import string, random
> +    testfile = os.path.join(filepath, ''.join(random.choice(string.ascii_letters) for x in range(200)))
>      try:
>          if not os.path.exists(filepath):
>              bb.utils.mkdirhier(filepath)



