Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A419A6E9BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 18:22:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Jan 2014 10:18:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,737,1384329600"; d="scan'208";a="473899586"
Received: from unknown (HELO [10.255.13.56]) ([10.255.13.56])
	by orsmga002.jf.intel.com with ESMTP; 28 Jan 2014 10:22:04 -0800
Message-ID: <52E7F54C.5020708@linux.intel.com>
Date: Tue, 28 Jan 2014 10:22:04 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Yue Tao <Yue.Tao@windriver.com>, openembedded-core@lists.openembedded.org
References: <1390788441-6563-1-git-send-email-Yue.Tao@windriver.com>
In-Reply-To: <1390788441-6563-1-git-send-email-Yue.Tao@windriver.com>
Subject: Re: [PATCH] The status for "service --status-all" is wrong after stop avahi-daemon
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
X-List-Received-Date: Tue, 28 Jan 2014 18:22:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/26/2014 06:07 PM, Yue Tao wrote:
> $/etc/init.d/avahi-daemon stop
> $service --status-all
> [ + ] avahi-daemon
>
> Add return value of status()
>

The short message needs to be formatted correctly:

avahi: <short log>

Also this patch is not added to the recipe file.

> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> ---
>   .../avahi/files/add_return_value_of_status.patch   |   21 ++++++++++++++++++++
>   1 files changed, 21 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-connectivity/avahi/files/add_return_value_of_status.patch
>
> diff --git a/meta/recipes-connectivity/avahi/files/add_return_value_of_status.patch b/meta/recipes-connectivity/avahi/files/add_return_value_of_status.patch
> new file mode 100644
> index 0000000..db80da8
> --- /dev/null
> +++ b/meta/recipes-connectivity/avahi/files/add_return_value_of_status.patch
> @@ -0,0 +1,21 @@

No Signed-off-by: or Upstream-Status: tags here

Sau!

> +--- a/initscript/debian/avahi-daemon.in
> ++++ b/initscript/debian/avahi-daemon.in
> +@@ -36,6 +36,8 @@
> + # Authors:      <sebastien.estienne@gmail.com>
> + #
> +
> ++. /etc/init.d/functions
> ++
> + if [ -f /lib/lsb/init-functions ]
> + then
> +     . /lib/lsb/init-functions
> +@@ -153,7 +155,8 @@ d_reload() {
> + #       Function that check the status of the daemon/service.
> + #
> + d_status() {
> +-    $DAEMON -c && echo "$DESC is running" || echo "$DESC is not running"
> ++    status $DAEMON
> ++    exit $?
> + }
> +
> + case "$1" in
>

