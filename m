Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa06-04.prod.phx3.secureserver.net
	(p3plsmtpa06-04.prod.phx3.secureserver.net [173.201.192.105])
	by mail.openembedded.org (Postfix) with ESMTP id 3246B71408
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 19:30:14 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa06-04.prod.phx3.secureserver.net with 
	id n7WE1o00B1mTNtu017WEBf; Thu, 04 Sep 2014 12:30:15 -0700
Message-ID: <5408BDC6.2060006@pabigot.com>
Date: Thu, 04 Sep 2014 14:30:14 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1409655125.git.Qi.Chen@windriver.com>
	<c57d855c12c783cdfa52f304e52fc2fd1267dd96.1409655125.git.Qi.Chen@windriver.com>
In-Reply-To: <c57d855c12c783cdfa52f304e52fc2fd1267dd96.1409655125.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 01/26] systemd: upgrade to 216
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
X-List-Received-Date: Thu, 04 Sep 2014 19:30:22 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2014 05:53 AM, Chen Qi wrote:
> Upgrade systemd from 213 to 216.

This broke me, because by 216 systemd started managing /etc/resolv.conf 
which is fine except that it uses a static configuration in 
/etc/systemd/resolved.conf, whereas in the 213 days I was getting 
/etc/resolv.conf managed by connman which set up the nameservers based 
on information it received from dhcp meaning one less per-host 
configuration file I need to manage.

I was able to get working behavior again by doing systemctl disable 
systemd-resolved, removing the /etc/resolv.conf symlink, and rebooting.

Further investigation suggests that systemd-networkd is intended to do 
the same sort of thing as connman, though so maybe I need to shoot that 
instead.

I have no answers, but just wanted to note that there now appears to be 
some conflict between connman and systemd that didn't used to be there. 
Maybe systemd-networkd and its constituent pieces need to be pulled out 
as a separate package?  Or some sort of conflict detection if both 
connman and systemd-networkd are in the same image?

Peter

