Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 125AE757B4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 15:04:34 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id DF5F5F811ED; Wed,  3 Jun 2015 09:04:35 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 728E1F811EB;
	Wed,  3 Jun 2015 09:04:34 -0600 (MDT)
Message-ID: <556F17A6.8080904@mlbassoc.com>
Date: Wed, 03 Jun 2015 09:05:10 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1433342867-4644-1-git-send-email-gary@mlbassoc.com>
	<1433342867-4644-2-git-send-email-gary@mlbassoc.com>
	<20150603145713.GC2380@jama>
In-Reply-To: <20150603145713.GC2380@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] gst-player: Update to latest GIT
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
X-List-Received-Date: Wed, 03 Jun 2015 15:04:38 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-06-03 08:57, Martin Jansa wrote:
> On Wed, Jun 03, 2015 at 08:47:46AM -0600, Gary Thomas wrote:
>> This patch brings gst-player up to a more recent version (2015-0-21)
>> Also, drop old patches which have been incorporated upstream.
>
> 2015-0-21?

Oops - it's correct in the cover letter 2015-05-21

>
>>
>> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
>> ---
>>   .../gstreamer/gst-player/gtk2.patch                | 121 +++++++++++++++++++--
>>   .../recipes-multimedia/gstreamer/gst-player_git.bb |   7 +-
>>   2 files changed, 112 insertions(+), 16 deletions(-)
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/gst-player/gtk2.patch b/meta/recipes-multimedia/gstreamer/gst-player/gtk2.patch
>> index 2cd18bb..6cc8946 100644
>> --- a/meta/recipes-multimedia/gstreamer/gst-player/gtk2.patch
>> +++ b/meta/recipes-multimedia/gstreamer/gst-player/gtk2.patch
>> @@ -5,10 +5,10 @@ Upstream-Status: Inappropriate
>>   Signed-off-by: Ross Burton <ross.burton@intel.com>
>>
>>
>> -diff --git a/configure.ac b/configure.ac
>> -index b8af13b..90ab74c 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> +Index: git/configure.ac
>> +===================================================================
>> +--- git.orig/configure.ac
>> ++++ git/configure.ac
>>   @@ -60,7 +60,7 @@ AC_SUBST(GLIB_PREFIX)
>>    GST_PREFIX="`$PKG_CONFIG --variable=prefix gstreamer-1.0`"
>>    AC_SUBST(GST_PREFIX)
>> @@ -18,14 +18,15 @@ index b8af13b..90ab74c 100644
>>    AM_CONDITIONAL(HAVE_GTK, test "x$have_gtk" != "xno")
>>
>>    GOBJECT_INTROSPECTION_CHECK([1.31.1])
>> -diff --git a/gtk/gtk-play.c b/gtk/gtk-play.c
>> -index f015077..954d6fb 100644
>> ---- a/gtk/gtk-play.c
>> -+++ b/gtk/gtk-play.c
>> -@@ -34,6 +34,46 @@ typedef struct
>> -   gulong seekbar_value_changed_signal_id;
>> - } GtkPlay;
>> +Index: git/gtk/gtk-play.c
>> +===================================================================
>> +--- git.orig/gtk/gtk-play.c
>> ++++ git/gtk/gtk-play.c
>> +@@ -98,6 +98,145 @@ enum
>> + };
>>
>> + static void display_cover_art (GtkPlay * play, GstPlayerMediaInfo * media_info);
>> ++
>>   +/* Compat stubs */
>>   +GtkWidget *
>>   +gtk_box_new (GtkOrientation orientation,
>> @@ -66,6 +67,104 @@ index f015077..954d6fb 100644
>>   +    return gtk_vscale_new_with_range (min, max, step);
>>   +  }
>>   +}
>> ++
>> ++/**
>> ++ * gtk_window_close:
>> ++ * @window: a #GtkWindow
>> ++ *
>> ++ * Requests that the window is closed, similar to what happens
>> ++ * when a window manager close button is clicked.
>> ++ *
>> ++ * This function can be used with close buttons in custom
>> ++ * titlebars.
>> ++ *
>> ++ * Since: 3.10
>> ++ */
>> ++void
>> ++gtk_window_close (GtkWindow *window)
>> ++{
>> ++#if 0
>> ++  if (!gtk_widget_get_realized (GTK_WIDGET (window)))
>> ++    return;
>> ++
>> ++  window->priv->delete_event_handler = gdk_threads_add_idle (send_delete_event, window);
>> ++  g_source_set_name_by_id (window->priv->delete_event_handler, "[gtk+] send_delete_event");
>> ++#endif
>> ++  gtk_widget_destroy(window);
>> ++}
>> ++
>> ++/**
>> ++ * gtk_widget_is_visible:
>> ++ * @widget: a #GtkWidget
>> ++ *
>> ++ * Determines whether the widget and all its parents are marked as
>> ++ * visible.
>> ++ *
>> ++ * This function does not check if the widget is obscured in any way.
>> ++ *
>> ++ * See also gtk_widget_get_visible() and gtk_widget_set_visible()
>> ++ *
>> ++ * Returns: %TRUE if the widget and all its parents are visible
>> ++ *
>> ++ * Since: 3.8
>> ++ **/
>> ++gboolean
>> ++gtk_widget_is_visible (GtkWidget *widget)
>> ++{
>> ++  g_return_val_if_fail (GTK_IS_WIDGET (widget), FALSE);
>> ++
>> ++  while (widget)
>> ++    {
>> ++      //      GtkWidgetPrivate *priv = widget->priv;
>> ++
>> ++      if (!gtk_widget_get_visible(widget))
>> ++        return FALSE;
>> ++
>> ++      //      widget = priv->parent;
>> ++      widget = widget->parent;
>> ++    }
>> ++
>> ++  return TRUE;
>> ++}
>> ++
>> ++/**
>> ++ * gtk_widget_get_allocated_width:
>> ++ * @widget: the widget to query
>> ++ *
>> ++ * Returns the width that has currently been allocated to @widget.
>> ++ * This function is intended to be used when implementing handlers
>> ++ * for the #GtkWidget::draw function.
>> ++ *
>> ++ * Returns: the width of the @widget
>> ++ **/
>> ++int
>> ++gtk_widget_get_allocated_width (GtkWidget *widget)
>> ++{
>> ++  g_return_val_if_fail (GTK_IS_WIDGET (widget), 0);
>> ++
>> ++  return widget->allocation.width;
>> ++}
>> ++
>> ++/**
>> ++ * gtk_widget_get_allocated_height:
>> ++ * @widget: the widget to query
>> ++ *
>> ++ * Returns the height that has currently been allocated to @widget.
>> ++ * This function is intended to be used when implementing handlers
>> ++ * for the #GtkWidget::draw function.
>> ++ *
>> ++ * Returns: the height of the @widget
>> ++ **/
>> ++int
>> ++gtk_widget_get_allocated_height (GtkWidget *widget)
>> ++{
>> ++  g_return_val_if_fail (GTK_IS_WIDGET (widget), 0);
>> ++
>> ++  return widget->allocation.height;
>> ++}
>> ++
>> ++
>> ++/* end compat stubs */
>>
>>    static void
>>    set_title (GtkPlay * play, const gchar * title)
>> diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
>> index 54cfbbc..7a68284 100644
>> --- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
>> +++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
>> @@ -1,18 +1,15 @@
>>   SUMMARY="GStreamer playback helper library and examples"
>>
>>   LICENSE = "LGPL-2.0+"
>> -LIC_FILES_CHKSUM = "file://lib/gst/player/gstplayer.c;beginline=1;endline=19;md5=03aeca9d8295f811817909075a15ff65"
>> +LIC_FILES_CHKSUM = "file://lib/gst/player/gstplayer.c;beginline=1;endline=19;md5=e17548b76f29cc2fe3de3b61f9ff02d6"
>>
>>   DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gtk+"
>>
>>   SRC_URI = "git://github.com/sdroege/gst-player.git \
>> -           file://filechooser.patch \
>>              file://gtk2.patch \
>> -           file://Fix-pause-play.patch \
>> -           file://Add-error-signal-emission-for-missing-plugins.patch \
>
> Are these .patch files used somewhere else? If not then delete them in
> the same commit.
>
>>              file://gst-player.desktop"
>>
>> -SRCREV = "5386c5b984d40ef5434673ed62204e69aaf52645"
>> +SRCREV = "88e04854ffbeffb5fa37073fb6c1922a49bd16e5"
>>
>>   S = "${WORKDIR}/git"
>>
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

